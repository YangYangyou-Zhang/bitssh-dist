param(
    [Parameter(Mandatory = $true)][string]$Repo,   # e.g. yourname/bitssh-dist
    [string]$Tag = "v0.1.0",
    [string]$Title = "bitssh 0.1.0",
    [string]$Notes = "bitssh 0.1.0 installers (Windows x64, Linux x86_64, Linux arm64)."
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot

$files = @(
    (Join-Path $root "win\bitssh-win-x64.zip"),
    (Join-Path $root "linux\x86_64\bitssh_0.1.0_amd64.deb"),
    (Join-Path $root "linux\aarch64\bitssh_0.1.0_arm64.deb")
)
foreach ($f in $files) {
    if (-not (Test-Path -LiteralPath $f)) { throw "missing $f" }
}

$sums = Join-Path $root "sha256sums.txt"
$lines = foreach ($f in $files) {
    $name = Split-Path -Leaf $f
    $hash = (Get-FileHash -LiteralPath $f -Algorithm SHA256).Hash.ToLower()
    "$hash  $name"
}
Set-Content -LiteralPath $sums -Value $lines -Encoding ascii

gh release view $Tag --repo $Repo *> $null
if ($LASTEXITCODE -eq 0) {
    gh release upload $Tag @files $sums --repo $Repo --clobber
} else {
    gh release create $Tag @files $sums --repo $Repo --title $Title --notes $Notes
}
