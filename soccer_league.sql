DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT UNIQUE NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams (id), ON DELETE CASCADE,
    player_id INTEGER REFERENCES players (id), ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches (id), ON DELETE CASCADE
); 

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    DOB INTEGER NOT NULL,
    team_id INTEGER REFERENCES team (id), ON DELETE CASCADE
); 

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES team (id), ON DELETE CASCADE,
    match_date DATE,
    season_id INTEGER REFERENCES season (id), ON DELETE CASCADE,
    referee_id INTEGER REFERENCES referee (id), ON DELETE CASCADE
); 

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
); 

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    date_start DATE,
    date_end DATE
); 


CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    ranking INTEGER,
    team_id INTEGER REFERENCES teams (id), ON DELETE CASCADE
    match_id INTEGER REFERENCES matches (id), ON DELETE CASCADE
);


INSERT INTO teams (team_name)
VALUES ('Seawolves');

INSERT INTO goals (team_id, player_id, match_id)
VALUES (1,1,1);

INSERT INTO players (first_name, last_name, DOB, team_id)
VALUES ('John', 'Doe', 01-01-2000, 1);

INSERT INTO matches (team_id, match_date, season_id, referee_id)
VALUES (1, '05-05-2023', 1, 1);

INSERT INTO referees (first_name, last_name)
VALUES ('Jane', 'Doe');

INSERT INTO season (date_start, date_end)
VALUES ('03-02-2023', '05-30-2023');

INSERT INTO results (ranking, team_id, match_id)
VALUES (1, 1, 1);