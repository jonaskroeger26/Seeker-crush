-- Run this in Supabase SQL Editor first.
-- Creates the leaderboards table, indexes, and RLS policies.
-- Same table is used by both Snake and Candy Crush (game_mode differentiates).

CREATE TABLE IF NOT EXISTS leaderboards (
  id BIGSERIAL PRIMARY KEY,
  wallet_address TEXT NOT NULL,
  skr_name TEXT,
  score INTEGER NOT NULL,
  game_mode TEXT NOT NULL,
  difficulty TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_leaderboards_mode_difficulty
  ON leaderboards(game_mode, difficulty, score DESC);

CREATE INDEX IF NOT EXISTS idx_leaderboards_wallet
  ON leaderboards(wallet_address);

ALTER TABLE leaderboards ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public read access" ON leaderboards;
CREATE POLICY "Allow public read access" ON leaderboards
  FOR SELECT USING (true);

DROP POLICY IF EXISTS "Allow public insert access" ON leaderboards;
CREATE POLICY "Allow public insert access" ON leaderboards
  FOR INSERT WITH CHECK (true);
