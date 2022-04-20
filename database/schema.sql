CREATE DATABASE my_catalog;

CREATE TABLE authors (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
first_name VARCHAR(100),
last_name VARCHAR(100),
items text[],
PRIMARY KEY (id)
);

CREATE TABLE genres (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
name VARCHAR(100),
items text[],
PRIMARY KEY (id)
);

CREATE TABLE labels (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
title VARCHAR(100),
color VARCHAR(100),
items text[],
PRIMARY KEY (id)
);

CREATE TABLE Book (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  published_at TIMESTAMP,
  archived BOOLEAN,
  author_id INT,
  genre_id INT,
  label_id INT,
  publisher VARCHAR(100),
  cover_state text,
  PRIMARY KEY (id),
  CONSTRAINT fk_book_Authors FOREIGN KEY(author_id) REFERENCES authors (id),
  CONSTRAINT fk_book_Genres FOREIGN KEY(genre_id) REFERENCES genres (id),
  CONSTRAINT fk_book_Labels FOREIGN KEY(label_id) REFERENCES labels (id)
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

CREATE TABLE MusicAlbum (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  published_at TIMESTAMP,
  archived BOOLEAN,
  author_id INT,
  genre_id INT,
  label_id INT,
  on_spotify BOOLEAN,
  album_author_id INT,
  album_genre_id INT,
  album_label_id INT,
  PRIMARY KEY (id),
  CONSTRAINT fk_album_Authors FOREIGN KEY(album_author_id) REFERENCES authors (id),
  CONSTRAINT fk_album_Genres FOREIGN KEY(album_genre_id) REFERENCES genres (id),
  CONSTRAINT fk_album_Labels FOREIGN KEY(album_label_id) REFERENCES labels (id)
); 
