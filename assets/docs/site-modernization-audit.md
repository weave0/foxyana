Foxyana Site Modernization Audit

Date: 2026-05-11
Scope: live-site behavior at https://foxyana.com plus deploy/config files in this repo.

Current state

- The live site is coherent and production-ready on the main surfaces: `/`, `/guide`, `/music`, and `/dance` all return `200`.
- The `.html` variants for the main surfaces redirect to clean URLs:
  - `/guide.html` -> `/guide`
  - `/music.html` -> `/music`
  - `/dance.html` -> `/dance`
- Live metadata basics are in place on the main pages: title, meta description, and canonical tags are present.
- Deploy/config hygiene is good in `wrangler.toml`, `robots.txt`, `sitemap.xml`, and `_headers`.
- The local HTML files in this workspace are not reliable source files right now. They are null-filled placeholders and cannot support a code-level audit.

Verified issues

1. Broken official release route

- `/official-release` returns `404`.
- `/official-release.html` returns `404`.
- The music page links to the official release system, so this is a live broken journey.

2. Source-of-truth gap in the repo

- `index.html`, `guide.html`, `music.html`, `dance.html`, `official-release.html`, and `404.html` are present locally but null-filled.
- Until those files are restored from a valid source, structural improvements to the pages should be treated as blocked in this checkout.

3. Asset structure is usable but drifting

- `assets/images` currently mixes:
  - root-level shared site images
  - numbered episode folders `01` through `10`
  - named collections like `Intro`, `DJ Foxyana`, and `ukraine-guide`
- This works today, but adding future art into the root will make maintenance harder.

Highest-value modernization moves

Priority 1

- Restore the real HTML source files into this repo.
- Repair or remove the broken official release route.
- Normalize all internal links to clean URLs only.

Priority 2

- Replace remaining `unsafe-inline` CSP allowances with hashed or external assets where practical.
- Introduce a repeatable content update workflow so live pages are generated from a trustworthy source instead of hand-maintained snapshots.
- Add a release checklist covering route checks, broken-link scan, sitemap freshness, and asset-weight review.

Priority 3

- Move toward a clearer asset taxonomy for future additions.
- Add structured data where it helps discovery, especially on guide, music, and video/release surfaces.
- Review image delivery strategy for consistent WebP-first usage and explicit fallback rules.

Recommended next step

Once the actual page sources are restored, run a page-level pass focused on:

1. Broken journeys and internal linking
2. Accessibility and semantic structure
3. Metadata consistency and share-card quality
4. CSP hardening and asset loading behavior
