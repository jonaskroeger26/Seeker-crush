# Seeker Crush – Solana dApp

Match-3 game (Candy Crush–style) as a Solana dApp. Built from the same stack as [Snake-Web](https://github.com/jonaskroeger26/Snake-Web): PWA, wallet (Seeker/Phantom), .skr domains, Supabase leaderboard.

## Features

- **Match-3 gameplay** – Swap adjacent candies to make rows or columns of 3+, score points, limited moves
- **Wallet** – Connect via Seeker/Seed Vault (MWA) or Phantom; .skr names shown when available
- **Leaderboard** – Supabase-backed; best score per wallet for `game_mode: 'seeker_crush'`, `difficulty: 'classic'`
- **PWA** – Installable from the web

## Quick start

```bash
npm install
npm run build:mwa   # optional: rebuild MWA bundle with Candy Crush app name
npm run dev
```

Then open `http://localhost:5173`.

## Leaderboard

Uses the same Supabase table as the Snake app. Ensure you have:

1. Table `leaderboards` (see `app/supabase-01-leaderboards-table.sql` if you need to create it)
2. Function `get_best_scores(p_game_mode, p_difficulty)` (see `app/supabase-02-get-best-scores.sql`)

Scores are stored with `game_mode: 'seeker_crush'` and `difficulty: 'classic'`.

## Deploy (Vercel)

1. In [Vercel](https://vercel.com), **Add New Project** and import **Seeker-crush** from GitHub.
2. Leave **Root Directory** empty (repo root is the app).
3. **Build Command** and **Output Directory** are set in `vercel.json` (`npm run build` → `dist`). If the dashboard shows different values, override with: Build = `npm run build`, Output = `dist`.
4. Deploy. The production URL will serve the app; the SPA rewrite sends all non-file routes to `index.html`.
5. Optional: add `api/` as serverless functions in project settings if you use the SKR lookup API.

## Scripts

| Script | Purpose |
|--------|--------|
| `npm run dev` | Start Vite dev server |
| `npm run build` | Production build to `dist/` |
| `npm run build:mwa` | Rebuild MWA bundle (app/mwa-entry.js → app/mwa-bundle.js) |
| `npm run fetch-skr-domains` | Fetch .skr data into CSV |
| `npm run convert-csv` | Convert CSV to api/skr-lookup.json |

## License

MIT.
