CREATE TABLE `region` (
    `region_id` VARCHAR(50) PRIMARY KEY,
    `region_name` TEXT
);

CREATE TABLE `confederations` (
    `key_id` TEXT,
    `confederation_id` VARCHAR(50) PRIMARY KEY,
    `confederation_name` TEXT,
    `confederation_code` TEXT,
    `confederation_wikipedia_link` TEXT
);

CREATE TABLE `awards` (
    `key_id` TEXT,
    `award_id` VARCHAR(50) PRIMARY KEY,
    `award_name` TEXT,
    `award_description` TEXT,
    `year_introduced` TEXT
);

CREATE TABLE `position` (
    `position_id` VARCHAR(50) PRIMARY KEY,
    `position_name` TEXT,
    `position_code` TEXT
);

CREATE TABLE `tournament` (
    `key_id` TEXT,
    `tournament_id` VARCHAR(50) PRIMARY KEY,
    `tournament_name` TEXT,
    `year` TEXT,
    `start_date` TEXT,
    `end_date` TEXT,
    `host_country` TEXT,
    `winner` TEXT,
    `host_won` TEXT,
    `count_teams` TEXT,
    `group_stage` TEXT,
    `second_group_stage` TEXT,
    `final_round` TEXT,
    `round_of_16` TEXT,
    `quarter_finals` TEXT,
    `semi_finals` TEXT,
    `third_place_match` TEXT,
    `final` TEXT
);

CREATE TABLE `players` (
    `key_id` TEXT,
    `player_id` VARCHAR(50) PRIMARY KEY,
    `given_name` TEXT,
    `family_name` TEXT,
    `birth_date` TEXT,
    `female` TEXT,
    `goal_keeper` TEXT,
    `defender` TEXT,
    `midfielder` TEXT,
    `forward` TEXT,
    `count_tournaments` TEXT,
    `list_tournaments` TEXT,
    `player_wikipedia_link` TEXT
);

CREATE TABLE `country` (
    `country_id` VARCHAR(50) PRIMARY KEY,
    `country_name` TEXT,
    `region_id` VARCHAR(50),
    FOREIGN KEY (`region_id`) REFERENCES `region`(`region_id`)
);

CREATE TABLE `city` (
    `city_id` VARCHAR(50) PRIMARY KEY,
    `city_name` TEXT,
    `country_id` VARCHAR(50),
    `city_wikipedia_link` TEXT,
    FOREIGN KEY (`country_id`) REFERENCES `country`(`country_id`)
);

CREATE TABLE `federation` (
    `federation_id` VARCHAR(50) PRIMARY KEY,
    `federation_name` TEXT,
    `confederation_id` VARCHAR(50),
    `country_id` VARCHAR(50),
    `federation_wikipedia_link` TEXT,
    FOREIGN KEY (`confederation_id`) REFERENCES `confederations`(`confederation_id`),
    FOREIGN KEY (`country_id`) REFERENCES `country`(`country_id`)
);

CREATE TABLE `stadiums` (
    `key_id` TEXT,
    `stadium_id` VARCHAR(50) PRIMARY KEY,
    `stadium_name` TEXT,
    `city_id` VARCHAR(50),
    `city_name` TEXT,
    `country_name` TEXT,
    `stadium_capacity` TEXT,
    `stadium_wikipedia_link` TEXT,
    FOREIGN KEY (`city_id`) REFERENCES `city`(`city_id`)
);

CREATE TABLE `teams` (
    `key_id` TEXT,
    `team_id` VARCHAR(50) PRIMARY KEY,
    `team_name` TEXT,
    `team_code` TEXT,
    `country_id` VARCHAR(50),
    `federation_id` VARCHAR(50),
    `mens_team` TEXT,
    `womens_team` TEXT,
    `federation_name` TEXT,
    `region_name` TEXT,
    `confederation_id` VARCHAR(50),
    `confederation_name` TEXT,
    `confederation_code` TEXT,
    `mens_team_wikipedia_link` TEXT,
    `womens_team_wikipedia_link` TEXT,
    `federation_wikipedia_link` TEXT,
    FOREIGN KEY (`country_id`) REFERENCES `country`(`country_id`),
    FOREIGN KEY (`federation_id`) REFERENCES `federation`(`federation_id`),
    FOREIGN KEY (`confederation_id`) REFERENCES `confederations`(`confederation_id`)
);

CREATE TABLE `matches` (
    `key_id` TEXT,
    `tournament_id` VARCHAR(50),
    `tournament_name` TEXT,
    `match_id` VARCHAR(50) PRIMARY KEY,
    `match_name` TEXT,
    `stage_name` TEXT,
    `group_name` TEXT,
    `group_stage` TEXT,
    `knockout_stage` TEXT,
    `replayed` TEXT,
    `replay` TEXT,
    `match_date` TEXT,
    `match_time` TEXT,
    `stadium_id` TEXT,
    `stadium_name` TEXT,
    `city_name` TEXT,
    `country_name` TEXT,
    `home_team_id` TEXT,
    `home_team_name` TEXT,
    `home_team_code` TEXT,
    `away_team_id` TEXT,
    `away_team_name` TEXT,
    `away_team_code` TEXT,
    `score` TEXT,
    `home_team_score` TEXT,
    `away_team_score` TEXT,
    `home_team_score_margin` TEXT,
    `away_team_score_margin` TEXT,
    `extra_time` TEXT,
    `penalty_shootout` TEXT,
    `score_penalties` TEXT,
    `home_team_score_penalties` TEXT,
    `away_team_score_penalties` TEXT,
    `result` TEXT,
    `home_team_win` TEXT,
    `away_team_win` TEXT,
    `draw` TEXT,
    FOREIGN KEY (`tournament_id`) REFERENCES `tournament`(`tournament_id`)
);

CREATE TABLE `goals` (
    `key_id` TEXT,
    `goal_id` VARCHAR(50) PRIMARY KEY,
    `tournament_id` TEXT,
    `tournament_name` TEXT,
    `match_id` VARCHAR(50),
    `match_name` TEXT,
    `match_date` TEXT,
    `stage_name` TEXT,
    `group_name` TEXT,
    `team_id` TEXT,
    `team_name` TEXT,
    `team_code` TEXT,
    `home_team` TEXT,
    `away_team` TEXT,
    `player_id` VARCHAR(50),
    `family_name` TEXT,
    `given_name` TEXT,
    `shirt_number` TEXT,
    `player_team_id` TEXT,
    `player_team_name` TEXT,
    `player_team_code` TEXT,
    `minute_label` TEXT,
    `minute_regulation` TEXT,
    `minute_stoppage` TEXT,
    `match_period` TEXT,
    `own_goal` TEXT,
    `penalty` TEXT,
    FOREIGN KEY (`match_id`) REFERENCES `matches`(`match_id`),
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`)
);

CREATE TABLE `player_appearances` (
    `key_id` TEXT,
    `tournament_id` VARCHAR(50),
    `tournament_name` TEXT,
    `match_id` VARCHAR(50),
    `match_name` TEXT,
    `match_date` TEXT,
    `stage_name` TEXT,
    `group_name` TEXT,
    `team_id` VARCHAR(50),
    `team_name` TEXT,
    `team_code` TEXT,
    `home_team` TEXT,
    `away_team` TEXT,
    `player_id` VARCHAR(50),
    `family_name` TEXT,
    `given_name` TEXT,
    `shirt_number` TEXT,
    `position_id` VARCHAR(50),
    `position_name` TEXT,
    `position_code` TEXT,
    `starter` TEXT,
    `substitute` TEXT,
    FOREIGN KEY (`tournament_id`) REFERENCES `tournament`(`tournament_id`),
    FOREIGN KEY (`match_id`) REFERENCES `matches`(`match_id`),
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`),
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`),
    FOREIGN KEY (`position_id`) REFERENCES `position`(`position_id`)
);

CREATE TABLE `award_winners` (
    `key_id` TEXT,
    `tournament_id` VARCHAR(50),
    `tournament_name` TEXT,
    `award_id` VARCHAR(50),
    `award_name` TEXT,
    `shared` TEXT,
    `player_id` VARCHAR(50),
    `family_name` TEXT,
    `given_name` TEXT,
    `team_id` VARCHAR(50),
    `team_name` TEXT,
    `team_code` TEXT,
    FOREIGN KEY (`tournament_id`) REFERENCES `tournament`(`tournament_id`),
    FOREIGN KEY (`award_id`) REFERENCES `awards`(`award_id`),
    FOREIGN KEY (`player_id`) REFERENCES `players`(`player_id`),
    FOREIGN KEY (`team_id`) REFERENCES `teams`(`team_id`)
);