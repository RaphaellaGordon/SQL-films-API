DROP DATABASE IF EXISTS female_leads;
CREATE DATABASE female_leads;
\c female_leads;

CREATE TABLE actresses (
  actress_id SERIAL PRIMARY KEY,
  actress_name VARCHAR,
  img VARCHAR
);

CREATE TABLE genres (
  genre_id SERIAL PRIMARY KEY,
  genre_name VARCHAR
);

CREATE TABLE films (
  film_id SERIAL PRIMARY KEY,
  film_name VARCHAR,
  film_year VARCHAR,
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

INSERT INTO actresses (actress_name, img)
VALUES
('Julia Roberts', 'https://m.media-amazon.com/images/M/MV5BMTQzNjU3MDczN15BMl5BanBnXkFtZTYwNzY2Njc4._V1_.jpg'),
('Jessica Chastain', 'https://m.media-amazon.com/images/M/MV5BMTU1MDM5NjczOF5BMl5BanBnXkFtZTcwOTY2MDE4OA@@._V1_SY1000_CR0,0,673,1000_AL_.jpg'),
('Hilary Swank', 'https://m.media-amazon.com/images/M/MV5BMTM5NzQzNTU4NV5BMl5BanBnXkFtZTcwMDAyOTMwMw@@._V1_.jpg'),
('Reese Witherspoon', 'https://m.media-amazon.com/images/M/MV5BMTc3MDcxMDA5Ml5BMl5BanBnXkFtZTgwNDM1NTU5MDE@._V1_SY1000_CR0,0,684,1000_AL_.jpg'),
('Amy Schumer', 'https://m.media-amazon.com/images/M/MV5BOTQ3MDc1MTI2Nl5BMl5BanBnXkFtZTcwMzYxMDgzOQ@@._V1_SY1000_CR0,0,911,1000_AL_.jpg'),
('Taraji P. Henson', 'https://m.media-amazon.com/images/M/MV5BMTc4NDQ2MTUwMl5BMl5BanBnXkFtZTcwODA2NDY3NQ@@._V1_SY1000_CR0,0,658,1000_AL_.jpg'),
('Felicity Jones', 'https://m.media-amazon.com/images/M/MV5BMjA0MTIwMzIyN15BMl5BanBnXkFtZTgwNDEyMzg1NDE@._V1_SY1000_CR0,0,664,1000_AL_.jpg'),
('Ming-Na Wen', 'https://m.media-amazon.com/images/M/MV5BMTIyNjUwNTk3OV5BMl5BanBnXkFtZTcwOTE4NTMzMQ@@._V1_UY317_CR19,0,214,317_AL_.jpg'),
('Irene Bedard', 'https://m.media-amazon.com/images/M/MV5BMTc1NTE2ODk2NV5BMl5BanBnXkFtZTYwMzAxMTI0._V1_UX214_CR0,0,214,317_AL_.jpg'),
('Kelly Macdonald', 'https://m.media-amazon.com/images/M/MV5BNDc5NTU2MzY0Nl5BMl5BanBnXkFtZTcwMzU4MjA0Ng@@._V1_UY317_CR9,0,214,317_AL_.jpg'),
('Kristen Bell', 'https://m.media-amazon.com/images/M/MV5BMjA1Njc0MTUzN15BMl5BanBnXkFtZTgwNTg1MjEwNDI@._V1_SY1000_CR0,0,661,1000_AL_.jpg'),
('Helen Mirren', 'https://m.media-amazon.com/images/M/MV5BMjA4MzY2ODU2MV5BMl5BanBnXkFtZTcwOTQ3ODY4OQ@@._V1_UY317_CR18,0,214,317_AL_.jpg'),
('Meryl Streep', 'https://m.media-amazon.com/images/M/MV5BMTU4Mjk5MDExOF5BMl5BanBnXkFtZTcwOTU1MTMyMw@@._V1_UY317_CR6,0,214,317_AL_.jpg'),
('Diane Keaton', 'https://m.media-amazon.com/images/M/MV5BNjU5NjMwOTk2NV5BMl5BanBnXkFtZTYwODg1NzY0._V1_UY317_CR4,0,214,317_AL_.jpg'),
('Julie Walters', 'https://m.media-amazon.com/images/M/MV5BMTM3NDA2NjE0M15BMl5BanBnXkFtZTcwMjk2ODIyOA@@._V1_UY317_CR1,0,214,317_AL_.jpg'),
('Sigourney Weaver', 'https://m.media-amazon.com/images/M/MV5BMTk1MTcyNTE3OV5BMl5BanBnXkFtZTcwMTA0MTMyMw@@._V1_UY317_CR12,0,214,317_AL_.jpg'),
('Keira Knightly', 'https://m.media-amazon.com/images/M/MV5BMTYwNDM0NDA3M15BMl5BanBnXkFtZTcwNTkzMjQ3OA@@._V1_UY317_CR6,0,214,317_AL_.jpg'),
('Sandra Bullock', 'https://m.media-amazon.com/images/M/MV5BMTI5NDY5NjU3NF5BMl5BanBnXkFtZTcwMzQ0MTMyMw@@._V1_UY317_CR1,0,214,317_AL_.jpg'),
('Carey Mulligan', 'https://m.media-amazon.com/images/M/MV5BMTUzODM0OTY4OF5BMl5BanBnXkFtZTgwMTg3NDk0NzE@._V1_UX214_CR0,0,214,317_AL_.jpg'),
('Emma Thompson', 'https://m.media-amazon.com/images/M/MV5BMTMwNTAyOTg0MF5BMl5BanBnXkFtZTcwNTg0MzY1Mw@@._V1_UY317_CR10,0,214,317_AL_.jpg'),
('Emilia Clarke', 'https://m.media-amazon.com/images/M/MV5BNjg3OTg4MDczMl5BMl5BanBnXkFtZTgwODc0NzUwNjE@._V1_UX214_CR0,0,214,317_AL_.jpg'),
('Alicia Vikander', 'https://m.media-amazon.com/images/M/MV5BZmMxYzk1OWEtMjE0MC00NTRlLTgwNTEtMGQ1YjA1Yzg1Nzc3XkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_UY317_CR3,0,214,317_AL_.jpg'),
('Melanie Griffith', 'https://m.media-amazon.com/images/M/MV5BMTUwODc4NTgxOV5BMl5BanBnXkFtZTcwNzgyNjY0MQ@@._V1_.jpg'),
('Charlize Theron', 'https://m.media-amazon.com/images/M/MV5BMTk5Mzc4ODU0Ml5BMl5BanBnXkFtZTcwNjU1NTI0Mw@@._V1_UY317_CR12,0,214,317_AL_.jpg');

INSERT INTO genres (genre_name)
VALUES
('Animation'), --1
('Biography'), --2
('Comedy'), --3
('Romance'), --4
('Sport'), --5
('Thriller'), --6
('Drama'), --7
('Action'); --8

INSERT INTO films (film_name, film_year, poster_url, genre_id, lead_character, lead_character_img_url, quote, lead_actress_id)
VALUES
('Brave', 2012, 'https://m.media-amazon.com/images/M/MV5BMzgwODk3ODA1NF5BMl5BanBnXkFtZTcwNjU3NjQ0Nw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 1, 'Merida', 'https://m.media-amazon.com/images/M/MV5BMTM1NDI4OTAxMV5BMl5BanBnXkFtZTcwNzU5NjkyNw@@._V1_SX1777_CR0,0,1777,961_AL_.jpg', 'I am Merida, firstborn descendant of Clan Dunbroch. And I''ll be shooting FOR MY OWN HAND!', 10),
('Collette', 2018, 'https://m.media-amazon.com/images/M/MV5BZTg5M2MxYzAtZjUwMi00MzRjLTkxNTItZmNjYzUxZjI3YzI3XkEyXkFqcGdeQXVyNDY2MjcyOTQ@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Collette', 'https://m.media-amazon.com/images/M/MV5BMjA0Nzk0NTQzMV5BMl5BanBnXkFtZTgwMzE2ODU0NDM@._V1_.jpg', '', 17),
('Conviction', 2010, 'https://m.media-amazon.com/images/M/MV5BMjEwNzUzNTk0Ml5BMl5BanBnXkFtZTcwMDE1MTk1Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Betty Anne Waters', 'https://m.media-amazon.com/images/M/MV5BMTM0NTU2OTMxNV5BMl5BanBnXkFtZTcwMzIyMzgxMw@@._V1_SY1000_CR0,0,1497,1000_AL_.jpg', 'You are innocent!', 3),
('Educating Rita', 1983, 'https://m.media-amazon.com/images/M/MV5BOTA2Njk1NzM5MF5BMl5BanBnXkFtZTcwNzAzMzMzMQ@@._V1_UY268_CR4,0,182,268_AL_.jpg', 3, 'Rita', 'https://m.media-amazon.com/images/M/MV5BYTBkNTRjNmItYjM5NC00YzBlLTk0ODAtOGE5N2EyZGExMzcxXkEyXkFqcGdeQXVyMjUyNDk2ODc@._V1_.jpg', '', 15),
('Erin Brockovich', 2000, 'https://m.media-amazon.com/images/M/MV5BYTA1NWRkNTktNDMxNS00NjE4LWEzMDAtNzA3YzlhYzRhNDA4L2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Erin Brockovich', 'https://m.media-amazon.com/images/M/MV5BMTQyMzExNjM4OV5BMl5BanBnXkFtZTcwMzg0OTczNQ@@._V1_SY1000_CR0,0,1502,1000_AL_.jpg', 'NOT PERSONAL! That is my WORK, my SWEAT, and MY TIME AWAY FROM MY KIDS! IF THAT IS NOT PERSONAL, I DON''T KNOW WHAT IS!', 1),
('First Wives Club', 1996, 'https://m.media-amazon.com/images/M/MV5BMzAwZTA3Y2UtMWVlMi00ZmNiLTkzZjAtYjA2YzBhMGMyYzQ2XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 3, 'Annie', 'https://m.media-amazon.com/images/M/MV5BZjAxYjcxM2EtM2EyMS00MGRiLWEyYWYtZDc4ZTA4MjcwZGNkXkEyXkFqcGdeQXVyNjkxMjM5Nzc@._V1_.jpg', 'I''m saying this, with love compassion and the spirit of true sisterhood... you are full of SHIT!', 14),
('Freedom Writers', 2007, 'https://m.media-amazon.com/images/M/MV5BMTIxMzExNTgxMV5BMl5BanBnXkFtZTcwNDUxODM0MQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Erin Gruwell', 'https://m.media-amazon.com/images/M/MV5BMTcwNjgxNDYyOV5BMl5BanBnXkFtZTYwMjYyMzM3._V1_.jpg', 'I can see you. And you are not failing.', 3),
('Frozen', 2013, 'https://m.media-amazon.com/images/M/MV5BMTQ1MjQwMTE5OF5BMl5BanBnXkFtZTgwNjk3MTcyMDE@._V1_UX182_CR0,0,182,268_AL_.jpg', 1, 'Anna', 'https://m.media-amazon.com/images/M/MV5BNWUzM2QyZTEtNTY4Zi00ODc3LThmZjgtNzZiM2YxNDc5N2RhL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjQyNjg3Nzk@._V1_SX1777_CR0,0,1777,792_AL_.jpg', 'The only frozen heart around here is yours.', 11),
('Gorillas in the Mist', 1988, 'https://m.media-amazon.com/images/M/MV5BZTZhZmVkNzUtNGE0MC00ZmNlLWJkMzMtYThkNjBmNmZhYmRjXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UY268_CR7,0,182,268_AL_.jpg', 2, 'Dian Fossey', 'https://m.media-amazon.com/images/M/MV5BNDg1ODQ2NzYxOV5BMl5BanBnXkFtZTgwNDYxNzY3NTM@._V1_SX1500_CR0,0,1500,999_AL_.jpg', 'Now wait a minute! I quit my job, left my fiancé, to say nothing of my appendix and flew halfway around the world. Those cases contain my hairdryer, my makeup, my underwear and my brassieres. If they don''t go, Dr Leakey, I don''t go.', 16),
('Hidden Figures', 2016, 'https://m.media-amazon.com/images/M/MV5BMzg2Mzg4YmUtNDdkNy00NWY1LWE3NmEtZWMwNGNlMzE5YzU3XkEyXkFqcGdeQXVyMjA5MTIzMjQ@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Katherine G. Johnson', 'https://m.media-amazon.com/images/M/MV5BOTVmNTQ2NTUtZjIzYy00YmM3LWFhMWMtOTY2MjU0NzQyYWE1L2ltYWdlXkEyXkFqcGdeQXVyNDg2MjUxNjM@._V1_SY1000_CR0,0,1497,1000_AL_.jpg', 'So yes, they let women do some things at NASA, Mr. Johnson. And it''s not because we wear skirts. It''s because we wear glasses. Have a good day.', 6),
('I Feel Pretty', 2018, 'https://m.media-amazon.com/images/M/MV5BMGI3ZDRjZTQtMTMyYy00NGI4LWI2MjktNzMyMjg0NjQ2NTY0XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 3, 'Renee Bennett', 'https://m.media-amazon.com/images/M/MV5BMTg2NDI5MjQ0Ml5BMl5BanBnXkFtZTgwMDAzOTY3NDM@._V1_SX1500_CR0,0,1500,999_AL_.jpg', 'If you ever get the chance to hangout with me or my friends, my amazing perfect friends, well all I have to say to you is you''re welcome.', 5),
('The Iron Lady', 2011, 'https://m.media-amazon.com/images/M/MV5BODEzNDUyMDE3NF5BMl5BanBnXkFtZTcwMTgzOTg3Ng@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Margaret Thatcher', 'https://m.media-amazon.com/images/M/MV5BNDM4YzM3ZmEtZWE1OS00Zjg4LTkxNWUtOTdhNzQ2MWVjMjliL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTc3MjUzNTI@._V1_.jpg', 'Do you know, one of the greatest problems of our age is that we are governed by people who care more about feelings than they do about thoughts and ideas? Now, thoughts and ideas, that interests me.', 13),
('Legally Blonde', 2001, 'https://m.media-amazon.com/images/M/MV5BNTEyNjUwMTkxMV5BMl5BanBnXkFtZTcwNjk0NDk0NA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 3, 'Elle Woods', 'https://m.media-amazon.com/images/M/MV5BMzYwNTUyMjk4N15BMl5BanBnXkFtZTcwMjg0NDk0NA@@._V1_.jpg', 'But if I''m going to be a partner in a law firm by the time I''m 30, I need a boyfriend who''s not such a complete bonehead.', 4),
('Me before you', 2016, 'https://m.media-amazon.com/images/M/MV5BMTQ2NjE4NDE2NV5BMl5BanBnXkFtZTgwOTcwNDE5NzE@._V1_UX182_CR0,0,182,268_AL_.jpg', 4, 'Lou Clark', 'https://m.media-amazon.com/images/M/MV5BYzdkOTUyYWUtNGEyOC00OTAyLWEyMmMtMTBjMThjNzg1OTQ3L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTc3MjUzNTI@._V1_.jpg', '220 calories. But, there is less if you eat them standing up.', 21),
('Million Dollar Baby', 2004, 'https://m.media-amazon.com/images/M/MV5BMTkxNzA1NDQxOV5BMl5BanBnXkFtZTcwNTkyMTIzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 5, 'Maggie Fitzgerald', 'https://m.media-amazon.com/images/M/MV5BOTA2Mzc1OTEyOF5BMl5BanBnXkFtZTcwNDU3NTUyMw@@._V1_SY1000_CR0,0,1501,1000_AL_.jpg', 'If I was thinking straight, I''d go back home, find a used trailer, buy a deep fryer and some oreos. Problem is, this the only thing I ever felt good doing. If I''m too old for this, then I got nothing.', 3),
('Miss Sloane', 2016, 'https://m.media-amazon.com/images/M/MV5BMTAyODY4Njc4MjBeQTJeQWpwZ15BbWU4MDI0NTIzMDAy._V1_UX182_CR0,0,182,268_AL_.jpg', 6, 'Madeline Elizabeth Sloane', 'https://m.media-amazon.com/images/M/MV5BNzE2NTA2YzAtNjIxOS00OWQ3LWJkZWItMTc4YjVlNmM0YTUwL2ltYWdlXkEyXkFqcGdeQXVyNDg2MjUxNjM@._V1_SX1777_CR0,0,1777,999_AL_.jpg', 'You crossed the line when you stopped treating people with respect. You''re smart enough to know that. You just don''t care.', 2),
('Molly’s Game', 2017, 'https://m.media-amazon.com/images/M/MV5BNTkzMzRlYjEtMTQ5Yi00OWY3LWI0NzYtNGQ4ZDkzZTU0M2IwXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Molly Bloom', 'https://m.media-amazon.com/images/M/MV5BMDQ2MjA5M2YtOWQ1ZS00NTlhLTgwZTItMzIyMzZjM2Y4ZDQ2XkEyXkFqcGdeQXVyNzg2ODI2OTU@._V1_SX1777_CR0,0,1777,727_AL_.jpg', 'You know what makes you feel okay about losing? Winning.', 2),
('Mona Lisa Smile', 2003, 'https://m.media-amazon.com/images/M/MV5BMTI0NjEwNDgwOV5BMl5BanBnXkFtZTYwOTI1NTA3._V1_UX182_CR0,0,182,268_AL_.jpg', 7, 'Katherine Ann Watson', 'https://m.media-amazon.com/images/M/MV5BMTk3NjI1ODI5MF5BMl5BanBnXkFtZTYwOTU0NTA3._V1_.jpg', 'The smartest women in the country, I didn''t realize that by demanding excellence I would be challenging... what did it say?... the roles you were born to fill.', 1),
('Mulan', 1998, 'https://m.media-amazon.com/images/M/MV5BODkxNGQ1NWYtNzg0Ny00Yjg3LThmZTItMjE2YjhmZTQ0ODY5XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 1, 'Mulan', 'https://m.media-amazon.com/images/M/MV5BNzM4ZWJkMjctMWZlYy00ZDZhLTkwMzctODU4OGYzNGE4MTRhXkEyXkFqcGdeQXVyNTQxMTIxMTk@._V1_SY1000_CR0,0,1688,1000_AL_.jpg', 'My little baby, off to destroy people.', 8),
('North Country', 2005, 'https://m.media-amazon.com/images/M/MV5BNTM3OTEwODYzNl5BMl5BanBnXkFtZTcwNjM1NzUzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Josey Aimes', 'https://m.media-amazon.com/images/M/MV5BMjE3MzM0MTI1OV5BMl5BanBnXkFtZTcwMDI1NzUzMw@@._V1_SY1000_CR0,0,1534,1000_AL_.jpg', 'You don''t go to work scared of what they write about you on the walls, or what kind of disgusting thing you might find in your locker. You don''t gotta be scared that one of these days you''ll come to work and get raped.', 24),
('Oceans Eight', 2018, 'https://m.media-amazon.com/images/M/MV5BMjAyNDEyMzc4Ml5BMl5BanBnXkFtZTgwMjEzNjM0NTM@._V1_UX182_CR0,0,182,268_AL_.jpg', 8, 'Debbie Ocean', 'https://m.media-amazon.com/images/M/MV5BMTk5Njk0MTkxNl5BMl5BanBnXkFtZTgwMjkwNTc1NTM@._V1_SX1777_CR0,0,1777,746_AL_.jpg', 'If you''re going to have a problem with stealing, then you''re not going to like the rest of this conversation.', 18),
('On the Basis of sex', 2018, 'https://m.media-amazon.com/images/M/MV5BYzJlYmEwYjEtMmE1Ny00ZjdiLTg2ZjctMmMxYjRhNGJkNTY2XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY268_CR3,0,182,268_AL_.jpg', 2, 'Ruth Bader Ginsburg', 'https://m.media-amazon.com/images/M/MV5BMTgwNDE1MjY3MV5BMl5BanBnXkFtZTgwMzU4MDQ3MzI@._V1_SY1000_CR0,0,939,1000_AL_.jpg', 'Judge: The word ''woman'' does not appear even once in the US Constitution. Ruth Bader Ginsburg: Nor does the word ''freedom'' Your Honor.', 7),
('Pocahontas', 1995, 'https://m.media-amazon.com/images/M/MV5BMzc4YzhiN2ItY2Y4NC00YTA0LWEyMjEtNzllNTcxZDdjODhiXkEyXkFqcGdeQXVyNTUyMzE4Mzg@._V1_UX182_CR0,0,182,268_AL_.jpg', 1, 'Pocahontas', 'https://m.media-amazon.com/images/M/MV5BMTM0NTQ1MjQxNV5BMl5BanBnXkFtZTcwNjUyNTIyNw@@._V1_SY1000_CR0,0,1686,1000_AL_.jpg', 'My daughter speaks with the wisdom beyond her years. We''ve all come here with anger in our hearts, but she comes with courage and understanding. From this day forward, if there is to be more killing, it will not start with me.', 9),
('Pride and Prejudice', 2005, 'https://m.media-amazon.com/images/M/MV5BMTA1NDQ3NTcyOTNeQTJeQWpwZ15BbWU3MDA0MzA4MzE@._V1_UX182_CR0,0,182,268_AL_.jpg', 4, 'Elizabeth Bennet', 'https://m.media-amazon.com/images/M/MV5BMjIzNDU2Nzk4N15BMl5BanBnXkFtZTcwMjY1OTk0OQ@@._V1_.jpg', 'Only the deepest love will persuade me into matrimony, which is why I will end up an old maid.', 17),
('The Queen', 2006, 'https://m.media-amazon.com/images/M/MV5BMTQ3NTMxODg1Ml5BMl5BanBnXkFtZTcwMjEyMjczMQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Queen Elizabeth II', 'https://m.media-amazon.com/images/M/MV5BMjA5MzI2Mjk1NF5BMl5BanBnXkFtZTgwMDk3OTYyMTI@._V1_.jpg', 'It wasn''t too short was it? Fifteen minutes, one doesn''t want to be rude.', 12),
('Sense and Sensibility', 1995, 'https://m.media-amazon.com/images/M/MV5BNzk1MjU3MDQyMl5BMl5BanBnXkFtZTcwNjc1OTM2MQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 4, 'Elinor Dashwood', 'https://m.media-amazon.com/images/M/MV5BNzMxODg2MjU5MF5BMl5BanBnXkFtZTcwNjQ3MTE0NQ@@._V1_SY1000_CR0,0,1491,1000_AL_.jpg', 'I knew a lady very like your sister - the same impulsive sweetness of temper - who was forced into, as you put it, a better acquaintance with the world. The result was only ruination and despair. Do not desire it, Miss Dashwood.', 20),
('Suffragette', 2015, 'https://m.media-amazon.com/images/M/MV5BMjA2NDYxOTI1MV5BMl5BanBnXkFtZTgwOTgyMjU3NjE@._V1_UX182_CR0,0,182,268_AL_.jpg', 2, 'Maud Watts', 'https://m.media-amazon.com/images/M/MV5BMTU1MjkwODQ4MV5BMl5BanBnXkFtZTgwOTE4ODk4NTE@._V1_SY1000_CR0,0,1503,1000_AL_.jpg',  'We break windows, we burn things. Cause war''s the only language men listen to! Cause you''ve beaten us and betrayed us and there''s nothing else left!', 19),
('Tomb Raider', 2018, 'https://m.media-amazon.com/images/M/MV5BOTY4NDcyZGQtYmVlNy00ODgwLTljYTMtYzQ2OTE3NDhjODMwXkEyXkFqcGdeQXVyNzYzODM3Mzg@._V1_UX182_CR0,0,182,268_AL_.jpg', 8, 'Lara Croft', 'https://m.media-amazon.com/images/M/MV5BMjEwNTk0NjM0OV5BMl5BanBnXkFtZTgwNTcwMDY3NDM@._V1_SX1500_CR0,0,1500,999_AL_.jpg', 'You messed with the wrong family.', 22),
('Working Girl', 1988, 'https://m.media-amazon.com/images/M/MV5BZTIwZGE5OWUtYzMxMi00Njk5LWI5NjAtMWYyMDljZGRjYWRlXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_UX182_CR0,0,182,268_AL_.jpg', 3, 'Tess McGill', 'https://m.media-amazon.com/images/M/MV5BYzk1ODc4NTEtZTA2My00MmNkLWE0OTEtNzc3ZGIzY2Q3Yjg1XkEyXkFqcGdeQXVyMjUyNDk2ODc@._V1_.jpg', 'You can bend the rules plenty once you get to the top, but not while you''re trying to get there. And if you''re someone like me, you can''t get there without bending the rules.', 23),
('Zero Dark Thirty', 2012, 'https://m.media-amazon.com/images/M/MV5BMTQ4OTUyNzcwN15BMl5BanBnXkFtZTcwMTQ1NDE3OA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 6, 'Maya', 'https://m.media-amazon.com/images/M/MV5BODcyODQ1ODU1N15BMl5BanBnXkFtZTcwOTU0NTU1OA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg', 'No, I just learned from my predecessor that life is better when I don''t disagree with you.', 2);

SELECT film_name, film_year, genre_id, lead_character, actress_name
FROM films
INNER JOIN actresses 
ON films.lead_actress_id = actresses.actress_id





-- block2 - wizards
