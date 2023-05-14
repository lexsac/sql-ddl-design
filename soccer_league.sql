-- from the terminal run:
-- psql < soccer_league.sql

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(255) NOT NULL,
    league_id INTEGER NOT NULL references leagues(id)
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    team_id INTEGER NOT NULL references teams(id)
);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE games (
    match_id SERIAL PRIMARY KEY,
    home_team_id INTEGER NOT NULL,
    away_team_id INTEGER NOT NULL,
    home_team_score INTEGER NOT NULL,
    away_team_score INTEGER NOT NULL
);

CREATE TABLE games_referees (
    id SERIAL PRIMARY KEY,
    FOREIGN KEY (game_id) REFERENCES games (id),
    FOREIGN KEY (referee_id) REFERENCES referees (id)
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL
);

CREATE TABLE leagues (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    season_id INTEGER NOT NULL references seasons(id)
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL references players(id),
    game_id INTEGER NOT NULL references games(id)
);