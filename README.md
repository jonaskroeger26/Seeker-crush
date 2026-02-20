# Candy Crush – Solana dApp

Match-3 Candy Crush-style game as a Solana dApp. Built from the same stack as [Snake-Web](https://github.com/jonaskroeger26/Snake-Web): PWA, wallet (Seeker/Phantom), .skr domains, Supabase leaderboard.

## Features

- **Match-3 gameplay** – Swap adjacent candies to make rows or columns of 3+, score points, limited moves
- **Wallet** – Connect via Seeker/Seed Vault (MWA) or Phantom; .skr names shown when available
- **Leaderboard** – Supabase-backed; best score per wallet for `game_mode: 'candy_crush'`, `difficulty: 'classic'`
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

Scores are stored with `game_mode: 'candy_crush'` and `difficulty: 'classic'`.

## Deploy

- **Vercel** – Connect this repo; root is the app root. Add `api/` as serverless functions.
- **Android / dApp Store** – Copy and adapt the `dapp-store-app/` from the Snake repo, then rebrand to Candy Crush (name, icon, PWA URL).

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
