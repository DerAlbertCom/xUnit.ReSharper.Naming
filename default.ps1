properties { 
  $base_dir  = resolve-path .
  $lib_dir = "$base_dir\external"
  $build_dir = "$base_dir\Build" 
  $buildartifacts_dir = "$build_dir\" 
  $sln_file = "$base_dir\Source\xUnit.ReSharper.Naming.sln" 
  $version = "1.1.0.0"
  $tools_dir = "$base_dir\Tools"
  $release_dir = "$base_dir\Release"
} 

task default -depends Release

task Clean { 
  remove-item -force -recurse $buildartifacts_dir -ErrorAction SilentlyContinue 
  remove-item -force -recurse $release_dir -ErrorAction SilentlyContinue 
} 

task Init -depends Clean { 
    . $tools_dir\psake\psake_ext.ps1
    
    Generate-Assembly-Info `
        -file "$base_dir\Source\GlobalAssemblyInfo.cs" `
        -title "xUnit.ReSharper.Naming" `
        -description "A context specification framework based on xUnit.net" `
        -product "xUnit.ReSharper.Naming $version" `
        -version $version `
        -clsCompliant "false" `
        -copyright "Copyright © Albert Weinert 2010"
        
    new-item $release_dir -itemType directory 
    new-item $buildartifacts_dir -itemType directory 
} 

task Compile -depends Init { 
  exec { msbuild "/p:OutDir=$buildartifacts_dir" "/p:Platform=Any CPU" "$sln_file" }
} 


task Release -depends Compile {
    
    exec {
    
      & $tools_dir\Zip\zip.exe -9 -A -j `
        $release_dir\xUnit.ReSharper.Naming.$version.zip `
        $build_dir\xUnit.ReSharper.Naming.dll 
    }
}
