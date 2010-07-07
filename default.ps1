properties { 
  $resharper_ver = "v5.1"
  $xunit_ver = "v1.6"

  $base_dir  = resolve-path .
  $lib_dir = "$base_dir\external"
  $thirdparty_dir = "$base_dir\ThirdParty" 
  $build_dir = "$base_dir\Build" 
  $buildartifacts_dir = "$build_dir\" 
  $sln_file = "$base_dir\Source\xUnit.ReSharper.Naming.sln" 
  $version = "0.5.1."
  $tools_dir = "$base_dir\Tools"
  $release_dir = "$base_dir\Release"
  $release_name = "${version}_X${xunit_ver}_R${resharper_ver}"
} 

$assversion = $version
 
task default -depends Release

task Clean { 
  remove-item -force -recurse $buildartifacts_dir -ErrorAction SilentlyContinue 
  remove-item -force -recurse $release_dir\*${resharper_ver}*.* -ErrorAction SilentlyContinue 
  remove-item -force -recurse $lib_dir\ReSharper\*.* -ErrorAction SilentlyContinue 
  remove-item -force -recurse $lib_dir\xUnit\*.* -ErrorAction SilentlyContinue 
} 

task CopyThirdParty -depends Clean {
	copy "$thirdparty_dir\ReSharper_$resharper_ver\*.*" "$lib_dir\ReSharper\"
	copy "$thirdparty_dir\xunit_$xunit_ver\*.*" "$lib_dir\xunit\"
}


task Init -depends CopyThirdParty  { 
   . $tools_dir\psake\psake_ext.ps1
   
     $buildver = GetAssemblyBuild("$lib_dir\ReSharper\JetBrains.ReSharper.Psi.dll")
   
     $finalversion = "$version$buildver"
    Generate-Assembly-Info `
        -file "$base_dir\Source\GlobalAssemblyInfo.cs" `
        -title "xUnit.ReSharper.Naming" `
        -description "Additional Naming Entities for ReSharper $resharper_ver" `
        -product "xUnit.ReSharper.Naming $finalversion" `
        -version $finalversion `
        -clsCompliant "false" `
        -copyright "Copyright © Albert Weinert 2010"
        
    new-item $release_dir -itemType directory -ErrorAction SilentlyContinue 
    new-item $buildartifacts_dir -itemType directory 
} 
task Compile -depends Init   { 
  exec { msbuild /t:rebuild "/p:OutDir=$buildartifacts_dir" "/p:Configuration=Release" "/p:Platform=Any CPU" "$sln_file" }
} 

task Release -depends Compile {
    
    exec {
    
      & $tools_dir\Zip\zip.exe -9 -A -j `
        $release_dir\xUnit.ReSharper.Naming.$release_name.zip `
        $build_dir\xUnit.ReSharper.Naming.dll readme.txt
    }
}
