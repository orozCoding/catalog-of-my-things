CREATE DATABASE my_catalog;

CREATE TABLE authors (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
first_name VARCHAR(100),
last_name VARCHAR(100),
items text[],
PRIMARY KEY (id)
);


CREATE TABLE Game (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  published_at TIMESTAMP,
  archived BOOLEAN,
  author_id INT,
  genre_id INT,
  label_id INT,
	multiplayer BOOLEAN,
	last_played_at TIMESTAMP,

  PRIMARY KEY (id),
  CONSTRAINT fk_game_Authors FOREIGN KEY(author_id) REFERENCES authors (id),
  CONSTRAINT fk_game_Genres FOREIGN KEY(genre_id) REFERENCES genres (id),
  CONSTRAINT fk_game_Labels FOREIGN KEY(label_id) REFERENCES labels (id)
);



