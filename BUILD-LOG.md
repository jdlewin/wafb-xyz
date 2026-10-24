# wafb.xyz scaffold — build log (Chewie, 2026-10-24)

## What built
Astro 4.16.19 static site, `npm run build` green. 3 pages: `/`, 2 essays, `/rss.xml`.

## Artifact paths
- Site root: `/Users/lawrence/.hermes/profiles/chewie/ops/wafb-xyz/`
- `package.json`, `astro.config.mjs` (site https://wafb.xyz), `tsconfig.json`
- `src/layouts/Base.astro` (viewport meta, rss link, minimal css)
- `src/content/config.ts` + `src/content/essays/iphone-duo-first-thoughts.md` + `what-this-site-is-for.md`
- `src/pages/index.astro`, `src/pages/essays/[slug].astro`, `src/pages/rss.xml.js`
- `sync-essays.sh`, `README.md`, `DOMAIN.md`, `public/robots.txt`
- Vault: `/Users/lawrence/vaults/blue-martian-cock/writing/essays/README.md` (convention), `_template.md`
- `dist/` build output (index, 2 essay pages, rss.xml)

## Build log (tail)
```
23:31:52 ▶ src/pages/essays/[slug].astro
  ├─ /essays/iphone-duo-first-thoughts/index.html
  └─ /essays/what-this-site-is-for/index.html
23:31:52 ▶ src/pages/index.astro └─ /index.html
23:31:52 λ src/pages/rss.xml.js └─ /rss.xml
[build] 3 page(s) built in 1.11s — Complete!
```

## Verification
- RSS parses, 2 items (`python xml.dom.minidom`).
- Index links both essay slugs; viewport meta present (mobile-readable baseline, unstyled MVP).
- sync-essays.sh: frontmatter-only `publish:true` match, skips `_ *`/`README*`,Convention files no longer leak into content. Positive test: publish:true file synced, publish:false skipped.
- Publish path: edit in Obsidian → `publish:true` → `./sync-essays.sh && npm run build` → commit/push → Pages builds `dist`. <5min, documented in README.

## Fixes during build
1. Stray `---` frontmatter written into `config.ts` and `rss.xml.js` — removed.
2. `slug` in collection schema is Astro-reserved — dropped from schema, routes use filename `entry.slug`.
3. Wrong relative Layout imports in both pages — corrected.
4. Sync script matched `publish:true` in body text (vault README false-positive) — rewrote to frontmatter-block awk + convention-file exclusion.

## Pinterest inspo (blocked, noted)
- `https://pin.it/1uieYPxm6` → 308 → `https://api.pinterest.com/url_shortener/1uieYPxm6/redirect/` → 200 at `pinterest.com/invited/?invite_code=c8bd...&board_id=455919230966617994` ("Letterhead Inspiration" collab invite). Login-walled; no usable thumbs/colors/type without auth.
- web_extract backend here is search-only, no page fetch. No credentials requested.
- Need from jd (any one): public board link (board slug URL, not invite link), or 3–5 screenshots, or Pinterest board export. Then theme pass, no rebuild.

## Not done (per brief)
- No github remote created/pushed. No Cloudflare Pages project wired (DOMAIN.md is a stub). No `~/wiki` touched, no config edited.
