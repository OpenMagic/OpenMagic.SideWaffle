Framework "4.5.1"

properties {

    # Solution specific
    $solutionFileName = "SideWaffleMagic.sln"

    # msbuild configuration
    $msbuildVerbosity = "minimal"
    $msbuildConfiguration = "Release"

    # Calculated properties
    $solutionDirectory = Join-Path $PSScriptRoot "..\"    
}

Task default -depends Compile

Task Compile -depends Clean { 

    # Despite setting the same environment variables I could not get
    #
    # msbuild $solutionFileName /target:rebuild /property:Configuration=$msbuildConfiguration /verbosity:$msbuildVerbosity /nologo
    #
    # to work. Error message C:\Users\Tim\Code\OpenMagic\SideWaffleMagic\Source\SideWaffleMagic\SideWaffleMagic.csproj(114,3): error MSB4019: The imported project "C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v12\VSSDK\Microsoft.VsSDK.targets" was not found. Confirm that the path in the <Import> declaration is correct, and that the file exists on disk.
    #
    # That's why I'm using .\Scripts\Support\VS2013-Environment-Then-msbuild.bat
    
    # msbuild $solutionFileName /target:rebuild /property:Configuration=$msbuildConfiguration /verbosity:$msbuildVerbosity /nologo
    Exec { .\Scripts\Support\VS2015-Environment-Then-msbuild.bat $solutionFileName rebuild $msbuildConfiguration $msbuildVerbosity }
}

Task Clean { 

    $msbuildArgs = @()
    $msbuildArgs += $solutionFileName
    $msbuildArgs += "/target:clean"
    $msbuildArgs += "/property:Configuration=$msbuildConfiguration"
    $msbuildArgs += "/verbosity:$msbuildVerbosity"
    $msbuildArgs += "/nologo"

    msbuild $msbuildArgs
}

TaskSetup {

    Write-Verbose "Push-Location to solution directory '$solutionDirectory'..."
    Push-Location $solutionDirectory

    Assert (Test-Path -Path $solutionFileName) "Cannot find solution file '$solutionFileName'."
}

TaskTearDown {

    Pop-Location
}

FormatTaskName {
   
    param(
        [string]$taskName
    )

    Write-Host
    Write-Host $taskName -ForegroundColor Cyan
    Write-Host ("-" * 70) -ForegroundColor Cyan
    Write-Host
}