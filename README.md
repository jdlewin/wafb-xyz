# wafb.xyz

Astro static site. Essays live in Obsidian vault, synced in.

## Publish (2 commands, <5min)

```
./sync-essays.sh
npm run build
```

Then commit + push; Cloudflare Pages builds `dist`. Flip `publish:true` in vault to publish.

## Dev

```
npm install
npm run dev
```

## Conventions

- Source of truth: vault `writing/essays/*.md`, frontmatter: title, slug, date, publish, pullquote, description.
- Only `publish:true` files sync into `src/content/essays/`.
- Routes: `/` index, `/essays/:slug/`, `/rss.xml`.
