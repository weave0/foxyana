Foxyana Art Asset Organization

Date: 2026-05-11
Purpose: define where future artwork should live in this repo so new drops stay organized and predictable.

Core rule

- Put new art in a dedicated collection folder under `assets/images/<collection-slug>/`.
- Do not add new long-term artwork directly to `assets/images/` unless it is truly shared site-wide brand imagery.

Current folder model

- `assets/images/01` through `assets/images/10`
  - episode-specific supporting images for the Ukraine guide
- `assets/images/ukraine-guide`
  - structured guide cover and panel assets used across the guide experience
- `assets/images/Intro`
  - intro-specific artwork
- `assets/images/DJ Foxyana`
  - music and DJ-oriented imagery
- `assets/images/` root
  - legacy shared site imagery already referenced by the live site

Recommended placement for future art

Use one folder per collection, release, campaign, or feature surface.

Examples

- `assets/images/site`
  - future shared brand art, reusable homepage visuals, evergreen portraits
- `assets/images/soul-already-knew`
  - art for a single release or video campaign
- `assets/images/album-2`
  - album-specific visuals and alternates
- `assets/images/live-session-kyiv`
  - imagery tied to one performance or editorial package

What should not go in the root

- new release art
- new editorial collections
- one-off gallery drops
- campaign-specific alternates

Only keep assets at the root if all of the following are true:

1. the image is reused across multiple primary pages
2. it is part of the stable brand surface
3. it is likely to stay evergreen rather than campaign-specific

Naming convention

Use lowercase kebab-like slugs with explicit role suffixes.

Recommended pattern

- `<nn>_<collection-slug>_<role>.<ext>`

Examples

- `01_soul-already-knew_hero.webp`
- `02_soul-already-knew_detail.webp`
- `03_soul-already-knew_atmosphere.png`
- `01_live-session-kyiv_poster.webp`

Role suffixes

- `hero`
- `wide`
- `detail`
- `portrait`
- `body`
- `atmosphere`
- `poster`
- `thumb`

Formats

- Prefer `.webp` for shipped web assets.
- Keep `.png` only when needed for source retention, transparency, or compatibility.
- If both formats are kept, match the basename exactly.

Examples

- `01_album-2_hero.webp`
- `01_album-2_hero.png`

Operational guidance

- For a new collection, create the folder first and keep all related variants inside it.
- Avoid spaces in new folder names.
- Avoid mixing unrelated campaigns in the same directory.
- If a collection gains multiple delivery contexts, keep one folder and differentiate through suffixes rather than creating near-duplicate directories.

Migration guidance

- Do not move existing root-level files unless the referencing HTML has been restored and updated in the same change.
- Treat current root-level assets as legacy in-place dependencies.
- Apply this convention to all new art going forward.
