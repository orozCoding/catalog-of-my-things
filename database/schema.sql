CREATE DATABASE my_catalog;

CREATE TABLE genres (
id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
name VARCHAR(100),
items text[],
PRIMARY KEY (id)
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