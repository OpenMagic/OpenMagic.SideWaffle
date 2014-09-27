param (
    [parameter(Mandatory=$true)]
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [string]
    $Path,

    [parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [string]
    $ErrorMessage = "Cannot find '$path'."
)

if (!(Test-Path $path)) {
    throw $errorMessage
}