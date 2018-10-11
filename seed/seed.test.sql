DROP DATABASE IF EXISTS female_leads_test;
CREATE DATABASE female_leads_test;
\c female_leads_test;

CREATE TABLE actresses (
  actress_id SERIAL PRIMARY KEY,
  actress_name VARCHAR,
  img_url VARCHAR
);

CREATE TABLE genres (
  genre_id SERIAL PRIMARY KEY,
  genre_name VARCHAR
);

CREATE TABLE films (
  film_id SERIAL PRIMARY KEY,
  film_name VARCHAR NOT NULL,
  film_year INT,
  poster_url VARCHAR,
  genre_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  votes INT DEFAULT 0,
  lead_character VARCHAR,
  lead_character_img_url VARCHAR,
  quote TEXT,
  lead_actress_id INT,
  FOREIGN KEY (lead_actress_id) REFERENCES actresses(actress_id)
);

INSERT INTO actresses (actress_name, img_url)
VALUES
('Julia Roberts', 'https://m.media-amazon.com/images/M/MV5BMTQzNjU3MDczN15BMl5BanBnXkFtZTYwNzY2Njc4._V1_.jpg'),
('Jessica Chastain', 'https://m.media-amazon.com/images/M/MV5BMTU1MDM5NjczOF5BMl5BanBnXkFtZTcwOTY2MDE4OA@@._V1_SY1000_CR0,0,673,1000_AL_.jpg'),
('Hilary Swank', 'https://m.media-amazon.com/images/M/MV5BMTM5NzQzNTU4NV5BMl5BanBnXkFtZTcwMDAyOTMwMw@@._V1_.jpg');

INSERT INTO genres (genre_name)
VALUES
('Animation'),
('Biography'),
('Comedy'),
('Romance'),
('Sport'),
('Thriller'),
('Drama');

INSERT INTO films (film_name, film_year, poster_url, genre_id, lead_character, lead_character_img_url, quote, lead_actress_id)
VALUES
('Conviction', 2010, 'https://m.media-amazon.com/images/M/MV5BMjEwNzUzNTk0Ml5BMl5BanBnXkFtZTcwMDE1MTk1Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Betty Anne Waters', 'https://m.media-amazon.com/images/M/MV5BMTM0NTU2OTMxNV5BMl5BanBnXkFtZTcwMzIyMzgxMw@@._V1_SY1000_CR0,0,1497,1000_AL_.jpg', 'You are innocent!', 3),
('Erin Brockovich', 2000, 'https://m.media-amazon.com/images/M/MV5BYTA1NWRkNTktNDMxNS00NjE4LWEzMDAtNzA3YzlhYzRhNDA4L2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Erin Brockovich', 'https://m.media-amazon.com/images/M/MV5BMTQyMzExNjM4OV5BMl5BanBnXkFtZTcwMzg0OTczNQ@@._V1_SY1000_CR0,0,1502,1000_AL_.jpg', 'NOT PERSONAL! That is my WORK, my SWEAT, and MY TIME AWAY FROM MY KIDS! IF THAT IS NOT PERSONAL, I DON''T KNOW WHAT IS!', 1),
('Zero Dark Thirty', 2012, 'https://m.media-amazon.com/images/M/MV5BMTQ4OTUyNzcwN15BMl5BanBnXkFtZTcwMTQ1NDE3OA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 6, 'Maya', 'https://m.media-amazon.com/images/M/MV5BODcyODQ1ODU1N15BMl5BanBnXkFtZTcwOTU0NTU1OA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg', 'No, I just learned from my predecessor that life is better when I don''t disagree with you.', 2);

-- SELECT film_name, film_year, genre_id, lead_character, actress_name
-- FROM films
-- INNER JOIN actresses 
-- ON films.lead_actress_id = actresses.actress_id


-- SELECT * FROM films;

-- SELECT * FROM films INNER JOIN genres ON films.genre_id = genres.genre_id WHERE films.genre_id = 2;

-- UPDATE films SET votes = +1
-- WHERE film_name = 'Conviction' 
-- RETURNING *;

-- block2 - wizards
