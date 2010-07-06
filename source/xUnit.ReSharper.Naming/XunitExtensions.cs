using System.Linq;
using JetBrains.ReSharper.Psi;
using xUnit.ReSharper.Naming.Wrappers;
using Xunit.Sdk;

namespace xUnit.ReSharper.Naming
{
    public static class XunitExtensions
    {
        private static readonly CLRTypeName PropertyDataAttributeName = new CLRTypeName("Xunit.Extensions.PropertyDataAttribute");

        private static bool IsUnitTestElement(IDeclaredElement element)
        {
            return element.IsUnitTestMethod() || IsUnitTestProperty(element) || element.IsUnitTestClass();
        }

        public static bool IsUnitTestMethod(this IDeclaredElement element)
        {
            return element.IsUnitTest();
        }

        private static bool IsUnitTestProperty(IDeclaredElement element)
        {
            if (element is IAccessor)
            {
                var accessor = ((IAccessor) element);
                return accessor.Kind == AccessorKind.GETTER && IsTheoryPropertyDataProperty(accessor.OwnerMember);
            }

            return element is IProperty && IsTheoryPropertyDataProperty((IProperty) element);
        }

        public static bool IsUnitTestClass(this IDeclaredElement element)
        {
            return element is IClass && (IsUnitTestContainer(element) || ContainsUnitTestElement((IClass) element));
        }

        private static bool IsTheoryPropertyDataProperty(ITypeMember element)
        {
            if (element.IsStatic && element.GetAccessRights() == AccessRights.PUBLIC)
            {
                // According to msdn, parameters to the constructor are positional parameters, and any
                // public read-write fields are named parameters. The name of the property we're after
                // is not a public field/property, so it's a positional parameter
                var propertyNames = from method in element.GetContainingType().Methods
                                    from attributeInstance in method.GetAttributeInstances(PropertyDataAttributeName, false)
                                    select attributeInstance.PositionParameter(0).ConstantValue.Value as string;
                return propertyNames.Any(name => name == element.ShortName);
            }

            return false;
        }

        private static bool ContainsUnitTestElement(ITypeElement element)
        {
            return element.NestedTypes.Aggregate(false, (current, nestedType) => IsUnitTestElement(nestedType) || current);
        }

        public static bool IsUnitTest(this IDeclaredElement element)
        {
            var testMethod = element as IMethod;
            return testMethod != null && MethodUtility.IsTest(testMethod.AsMethodInfo());
        }

        private static bool IsUnitTestContainer(IDeclaredElement element)
        {
            var testClass = element as IClass;
            return testClass != null && TypeUtility.IsTestClass(testClass.AsTypeInfo());
        }
    }
}