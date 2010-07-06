using JetBrains.ReSharper.Psi;

namespace xUnit.ReSharper.Naming
{
    public static class XunitBddExtensions
    {
        private static readonly CLRTypeName ConcernAttributeName = new CLRTypeName("Xunit.ConcernAttribute");
        private static readonly CLRTypeName ObservationAttributeName = new CLRTypeName("Xunit.ObservationAttribute");

        public static bool IsConcern(this IDeclaredElement declaredElement)
        {
            if (declaredElement.IsUnitTestClass())
            {
                var typeElement = declaredElement as ITypeElement;
                if (typeElement == null)
                    return false;

                if (typeElement.HasAttributeInstance(ConcernAttributeName, false))
                    return true;

                var types = typeElement.GetSuperTypes();

                foreach (var declaredType in types)
                {
                    var element = declaredType.GetTypeElement();
                    if (element != null && element.HasAttributeInstance(ConcernAttributeName, false))
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        public static bool IsObservation(this IDeclaredElement declaredElement)
        {
            if (declaredElement.IsUnitTestMethod())
            {
                var typeMember = declaredElement as ITypeMember;
                if (typeMember != null)
                    return typeMember.HasAttributeInstance(ObservationAttributeName, false);
            }
            return false;
        }
    }
}