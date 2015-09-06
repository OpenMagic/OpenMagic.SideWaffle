try {
    Push-Location $PSScriptRoot

    $module = Resolve-Path "..\..\Packages\psake\tools\psake.psm1"

    Write-Verbose "psake module: $module."
    return $module
}
finally {
    Pop-Location
}