param(
    [Parameter(Mandatory=$true)]
    [string]$port
)

$path = Split-Path -Parent $MyInvocation.MyCommand.Path
$files = Get-ChildItem -Path $path -Recurse -File

foreach ($file in $files) {
    $content = Get-Content $file.PSPath -Raw
    if ($content -match "3002") {
        $content -replace "3002", $port | Set-Content $file.PSPath
    }
}
