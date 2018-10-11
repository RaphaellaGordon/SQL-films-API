const db = require('../db');

const getGenres = (req, res, next) => {
  db.many('SELECT * FROM genres;')
  .then(genres => {
    res.send({ genres });
  })
  .catch(next);
}

const postGenre = (req, res, next) => {
  const newGenre = req.body;
 db.one('INSERT INTO genres (genre_name) VALUES ($<genre>) RETURNING *;', newGenre)
 .then(genre => {
    if (req.body.genre.length < 3) throw {status: 400}
    res.status(201).send({genre})
    })
 .catch(next)
}

const getGenreByName = (req, res, next) => {
  const genre = req.params.genre;
  if(Number(genre)) throw {status: 400}
  db.one('SELECT * FROM genres WHERE genre_name = $<genre>', {genre})
    .then(genre => {
      if (!genre) throw { status: 404 }
      res.status(200).send({ genre })
    })
  .catch(next)
}

const getFilmsByGenre = (req, res, next) => {
  const genre = req.params.genre;
  if(Number(genre)) throw {status: 400}
  db.one('SELECT genre_id FROM genres WHERE genre_name = $<genre>', {genre})
  .then(genre => {
    if (!genre) throw { status: 404 }
    const id = genre.genre_id
    return db.many('SELECT * FROM films INNER JOIN genres ON films.genre_id = genres.genre_id WHERE films.genre_id = $<id>', {id})
  })
  .then(films => {
    res.status(200).send({films})
  })
  .catch(next)
}

module.exports = { getGenres, getGenreByName, postGenre, getFilmsByGenre };