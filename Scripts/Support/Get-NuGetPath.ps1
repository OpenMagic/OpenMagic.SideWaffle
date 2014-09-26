$path = (Join-Path -Path $env:USERPROFILE -ChildPath "AppData\Local\NuGet\NuGet.exe")

try {
    Push-Location $PSScriptRoot
    .\Validate-Path.ps1 -Path $path -ErrorMessage "Cannot find NuGet executable '$path'."
}
finally {
    Pop-Location
}

return $path