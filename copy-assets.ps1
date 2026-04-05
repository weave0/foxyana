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

# -----------------------------------------------------------------------
# Ukraine Guide S1 — 10 episodes × wide cover (1792×1024)
# Source: SummitView/assets/generated/foxyana/ukraine-guide/s01/<slug>/images/
# Destination: assets/images/ukraine-guide/
# -----------------------------------------------------------------------
$guideDestDir = Join-Path $PSScriptRoot "assets\images\ukraine-guide"
if (-not (Test-Path $guideDestDir)) {
    New-Item -ItemType Directory -Path $guideDestDir | Out-Null
    Write-Host "Created $guideDestDir"
}

$guideSrc = "z:\GFD\GFD Dev Projects\SummitView\assets\generated\foxyana\ukraine-guide\s01"

$guideEpisodes = @(
    @{ slug = "mountains-remember";        ep = "01" },
    @{ slug = "egg-that-holds-the-world";  ep = "02" },
    @{ slug = "what-the-bandura-knows";    ep = "03" },
    @{ slug = "the-fold";                  ep = "04" },
    @{ slug = "the-golden-city";           ep = "05" },
    @{ slug = "the-wide-open";             ep = "06" },
    @{ slug = "the-word";                  ep = "07" },
    @{ slug = "the-forest-path";           ep = "08" },
    @{ slug = "the-river";                 ep = "09" },
    @{ slug = "the-childs-step";           ep = "10" }
)

$copiedGuide = 0
foreach ($ep in $guideEpisodes) {
    $slug     = $ep.slug
    $epNum    = $ep.ep
    $srcFile  = Join-Path $guideSrc "$slug\images\${epNum}_${slug}_wide.png"
    $destFile = Join-Path $guideDestDir "${epNum}_${slug}_wide.png"
    if (Test-Path $srcFile) {
        Copy-Item -Path $srcFile -Destination $destFile -Force
        Write-Host "Copied  ${epNum}_${slug}_wide.png"
        $copiedGuide++
    }
    else {
        Write-Warning "Missing $srcFile — skipped"
    }
}

Write-Host "`nUkraine Guide: $copiedGuide/10 cover images copied -> $guideDestDir"

