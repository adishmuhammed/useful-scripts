$folderPath = Read-Host "Enter the folder path"
$webpPath = Read-Host "Enter the output path"
if (!(Test-Path -Path $webpPath)) {
    New-Item -ItemType Directory -Path $webpPath
}
Get-ChildItem -Path $folderPath -Filter *.jpg | ForEach-Object {
    $fileName = $_.BaseName + ".webp"
    $webpFile = Join-Path -Path $webpPath -ChildPath $fileName
    & ".\bin\cwebp.exe" $_.FullName -o $webpFile
}