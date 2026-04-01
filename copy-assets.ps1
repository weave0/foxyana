# copy-assets.ps1
# Run once to bring Foxyana images from SummitView into this project.
# After running: commit assets/images/ to the repo.

$src = "z:\GFD\GFD Dev Projects\SummitView\assets\generated\foxyana"
$dest = Join-Path $PSScriptRoot "assets\images"

if (-not (Test-Path $dest)) {
    New-Item -ItemType Directory -Path $dest | Out-Null
    Write-Host "Created $dest"
}

$images = @(
    "foxyana_web_hero.png",
    "foxyana_web_portrait.png",
    "foxyana_web_stage.png",
    "foxyana_01_portrait_formal.png",
    "foxyana_02_kozachok_turn.png",
    "foxyana_03_mountain_overlook.png",
    "foxyana_04_cooking_kitchen.png",
    "foxyana_05_kolomyika_circle.png",
    "foxyana_06_contemplative_still.png",
    "foxyana_07_duality_moment.png"
)

foreach ($img in $images) {
    $srcFile = Join-Path $src  $img
    $destFile = Join-Path $dest $img
    if (Test-Path $srcFile) {
        Copy-Item -Path $srcFile -Destination $destFile -Force
        Write-Host "Copied  $img"
    }
    else {
        Write-Warning "Missing $srcFile — skipped"
    }
}

Write-Host "`nDone. $($images.Count) images processed -> $dest"
