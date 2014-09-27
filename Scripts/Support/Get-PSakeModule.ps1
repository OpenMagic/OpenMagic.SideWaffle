try {
    Push-Location $PSScriptRoot

    $version = .\Get-PSakeVersion.ps1
    $module = Resolve-Path "..\..\Packages\psake.$version\tools\psake.psm1"

    Write-Verbose "psake module: $module."
    return $module
}
finally {
    Pop-Location
}