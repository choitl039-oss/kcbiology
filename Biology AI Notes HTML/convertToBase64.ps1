# PowerShell script to convert ws_ch10_e_modified_leaf structure.png to Base64
$imagePath = "ws_ch10_e_modified_leaf structure.png"
$outputPath = "ws_ch10_e_modified_leaf structure_base64.txt"

# Create output directory if it doesn't exist
$outputDir = Split-Path $outputPath -Parent
if ($outputDir -and !(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

# Read the image file and convert to base64
$base64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($imagePath))
$dataUri = "data:image/png;base64,$base64"

# Save the data URI string to a text file
$dataUri | Out-File -FilePath $outputPath -Encoding ASCII

Write-Host "Conversion complete! Data URI saved to: $outputPath"
