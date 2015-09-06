param (
    [string]
    $NuGetPath = (."$PSScriptRoot\Get-NuGetPath.ps1")
)

Write-Verbose "Installing psake..."

try {
    Push-Location $PSScriptRoot

    .\Validate-Path -Path $NuGetPath -ErrorMessage "Cannot find NuGet executable '$NuGetPath'."

    $packagesDirectory = "..\..\Packages"
    $psakeDirectory = "$packagesDirectory\psake"

    if (Test-Path $psakeDirectory) {
        Write-Host "psake already installed."
        return
    }

    .$NuGetPath install psake -ExcludeVersion -OutputDirectory ..\..\Packages
    Write-Verbose "Installed psake."
}
finally {
    Pop-Location
}
