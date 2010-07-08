using System;
using System.Reflection;
using JetBrains.Annotations;
using JetBrains.ReSharper.Psi;
using JetBrains.ReSharper.Psi.Naming.Elements;

namespace xUnit.ReSharper.Naming
{
    [NamedElementsBag(null)]
    public class XunitElementNaming : ElementKindOfElementType
    {
        static XunitElementNaming()
        {
            AppDomain.CurrentDomain.ReflectionOnlyAssemblyResolve += CurrentDomainOnReflectionOnlyAssemblyResolve;
        }

        private static Assembly CurrentDomainOnReflectionOnlyAssemblyResolve(object sender, ResolveEventArgs args)
        {
           var names= args.Name.Split(',');
            return Assembly.LoadFrom(names[0]);
        }

        [UsedImplicitly]
        public static readonly IElementKind Observation =
            new XunitElementNaming("xunit.bddextension.observation",
                                   "xUnit Observation",
                                   IsObservation);


        [UsedImplicitly]
        public static readonly IElementKind Concern =
            new XunitElementNaming("xunit.bddextension.concern",
                                   "xUnit Concern",
                                   IsConcern);

        [UsedImplicitly]
        public static readonly IElementKind TestClass =
            new XunitElementNaming("xunit.testclass",
                                   "xUnit TestClass",
                                   IsTestClass);

        [UsedImplicitly]
        public static readonly IElementKind Fact =
            new XunitElementNaming("xunit.fact",
                                   "xUnit Test",
                                   IsUnitTest);

        private static bool IsTestClass(IDeclaredElement arg)
        {
            return arg.IsUnitTestClass();
        }


        private static bool IsUnitTest(IDeclaredElement arg)
        {
            return arg.IsUnitTest();
        }

        protected XunitElementNaming(string name, string presentableName,
                                     Func<IDeclaredElement, bool> isApplicable)
            : base(name, presentableName, isApplicable)
        {
        }

        public override PsiLanguageType Language
        {
            get { return PsiLanguageType.ANY; }
        }

        private static bool IsConcern(IDeclaredElement declaredElement)
        {
            return declaredElement.IsConcern();
        }


        private static bool IsObservation(IDeclaredElement declaredElement)
        {
            return declaredElement.IsObservation();
        }
    }
}