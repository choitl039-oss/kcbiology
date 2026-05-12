$img = [System.Drawing.Image]::FromFile('C:\FreemansData\Project\3Kingsman\Class\esp32_blynk\images\hero_image.png')
$maxW = 1920
$maxH = 1080
$ratio = [Math]::Min($maxW / $img.Width, $maxH / $img.Height)
$newW = [Math]::Floor($img.Width * $ratio)
$newH = [Math]::Floor($img.Height * $ratio)
$bmp = New-Object System.Drawing.Bitmap($newW, $newH)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.DrawImage($img, 0, 0, $newW, $newH)
$bmp.Save('C:\FreemansData\Project\3Kingsman\Class\esp32_blynk\images\hero_image_1080p.png', [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()
$img.Dispose()
Write-Host "Resized to ${newW}x${newH}"

# Now convert to base64
$base64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes('C:\FreemansData\Project\3Kingsman\Class\esp32_blynk\images\hero_image_1080p.png'))
$base64 | Out-File -FilePath 'C:\FreemansData\Project\3Kingsman\Class\esp32_blynk\images\imagesBase64\hero_image_1080p.txt' -Encoding ASCII
Write-Host "Base64 saved to hero_image_1080p.txt"
