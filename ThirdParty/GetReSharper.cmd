@echo off

if not exist "%ProgramFiles%\JetBrains\Resharper\v4.5\bin" goto CopyResharper_v45_x64

mkdir ReSharper_v4.5
cd ReSharper_v4.5
copy "%ProgramFiles%\JetBrains\ReSharper\v4.5\Bin\JetBrains.Annotations.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v4.5\Bin\JetBrains.Platform.ReSharper.ProjectModel.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v4.5\Bin\JetBrains.Platform.Resharper.UI.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v4.5\Bin\JetBrains.Platform.ReSharper.Util.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v4.5\Bin\JetBrains.ReSharper.Psi.???" > nul

cd ..
echo Support for ReSharper 4.5 successfully copied.

:CopyResharper_v45_x64

if not exist "%ProgramFiles(x86)%\JetBrains\Resharper\v4.5\bin" goto CopyResharper_v50_x86

mkdir ReSharper_v4.5
cd ReSharper_v4.5
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v4.5\Bin\JetBrains.Annotations.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v4.5\Bin\JetBrains.Platform.ReSharper.ProjectModel.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v4.5\Bin\JetBrains.Platform.Resharper.UI.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v4.5\Bin\JetBrains.Platform.ReSharper.Util.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v4.5\Bin\JetBrains.ReSharper.Psi.???" > nul

cd ..
echo Support for ReSharper 4.5 successfully copied. [Platform=x64]

:CopyResharper_v50_x86

if not exist "%ProgramFiles%\JetBrains\Resharper\v5.0\bin" goto CopyResharper_v50_x64

mkdir ReSharper_v5.0
cd ReSharper_v5.0
copy "%ProgramFiles%\JetBrains\ReSharper\v5.0\Bin\JetBrains.Annotations.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v5.0\Bin\JetBrains.Platform.ReSharper.ProjectModel.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v5.0\Bin\JetBrains.Platform.Resharper.UI.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v5.0\Bin\JetBrains.Platform.ReSharper.Util.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v5.0\Bin\JetBrains.ReSharper.Psi.???" > nul
cd ..

echo Support for ReSharper 5.0 successfully copied.

:CopyResharper_v50_x64

if not exist "%ProgramFiles(x86)%\JetBrains\Resharper\v5.0\bin" goto CopyResharper_v51_x86

mkdir ReSharper_v5.0
cd ReSharper_v5.0
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.0\Bin\JetBrains.Annotations.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.0\Bin\JetBrains.Platform.ReSharper.ProjectModel.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.0\Bin\JetBrains.Platform.Resharper.UI.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.0\Bin\JetBrains.Platform.ReSharper.Util.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.0\Bin\JetBrains.ReSharper.Psi.???" > nul
cd..

echo Support for ReSharper 5.0 successfully copied. [Platform=x64]

:CopyResharper_v51_x86

if not exist "%ProgramFiles%\JetBrains\Resharper\v5.1\bin" goto CopyResharper_v51_x64

mkdir ReSharper_v5.1
cd ReSharper_v5.1

copy "%ProgramFiles%\JetBrains\ReSharper\v5.1\Bin\JetBrains.Annotations.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v5.1\Bin\JetBrains.Platform.ReSharper.ProjectModel.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v5.1\Bin\JetBrains.Platform.Resharper.UI.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v5.1\Bin\JetBrains.Platform.ReSharper.Util.???" > nul
copy "%ProgramFiles%\JetBrains\ReSharper\v5.1\Bin\JetBrains.ReSharper.Psi.???" > nul
cd ..

echo Support for ReSharper 5.1 successfully copied.

:CopyResharper_v51_x64

if not exist "%ProgramFiles(x86)%\JetBrains\Resharper\v5.1\bin" goto End

mkdir ReSharper_v5.1
cd ReSharper_v5.1
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.1\Bin\JetBrains.Annotations.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.1\Bin\JetBrains.Platform.ReSharper.ProjectModel.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.1\Bin\JetBrains.Platform.Resharper.UI.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.1\Bin\JetBrains.Platform.ReSharper.Util.???" > nul
copy "%ProgramFiles(x86)%\JetBrains\ReSharper\v5.1\Bin\JetBrains.ReSharper.Psi.???" > nul
cd ..

echo Support for ReSharper 5.1 successfully copied. [Platform=x64]

goto End

:End