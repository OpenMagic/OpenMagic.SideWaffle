param (
    [string]
    $NuGetPath = (."$PSScriptRoot\Get-NuGetPath.ps1")
)

Write-Verbose "Installing psake..."

try {
    Push-Location $PSScriptRoot

    .\Validate-Path -Path $NuGetPath -ErrorMessage "Cannot find NuGet executable '$NuGetPath'."

    $psakeVersion = .\Get-PSakeVersion
    $packagesDirectory = "..\..\Packages"
    $psakeDirectory = "$packagesDirectory\psake.$psakeVersion"

    if (Test-Path $psakeDirectory) {
        Write-Host "psake $psakeVersion already installed."
        return
    }

    .$NuGetPath install psake -Version $psakeVersion -OutputDirectory ..\..\Packages
    Write-Verbose "Installed psake $psakeVersion."
}
finally {
    Pop-Location
}
