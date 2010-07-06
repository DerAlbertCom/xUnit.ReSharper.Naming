using System;
using System.Linq;
using JetBrains.ReSharper.Psi;
using JetBrains.ReSharper.Psi.Util;

namespace xUnit.ReSharper.Naming.Wrappers
{
    internal static class TypeExtensions
    {
        internal static bool IsAssignableFrom(this Type type, ITypeElement c)
        {
            return type.FullName == c.CLRName || TypeElementUtil.GetAllSuperTypes(c).Any(superType => type.FullName == c.CLRName);
        }

        internal static bool IsAssignableFrom(this Type type, IDeclaredType c)
        {
            return type.FullName == c.GetCLRName() || TypeElementUtil.GetAllSuperTypes(c).Any(superType => type.FullName == superType.GetCLRName());
        }
    }
}


