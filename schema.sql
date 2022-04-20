CREATE DATABASE my_catalog;

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
