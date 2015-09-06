param(
    [string[]]
    $TaskList = @()
)

Clear-Host

try {
    Push-Location $PSScriptRoot

    .\Support\Install-PSake.ps1

    $psakeModule = (.\Support\Get-PSakeModule.ps1)

    # '[p]sake' is the same as 'psake' but $Error is not polluted
    Remove-Module [p]sake

    Import-Module $psakeModule

    Invoke-psake .\Build-Tasks.ps1 $TaskList -nologo
}
finally {

    Pop-Location
}
