const db = require('../db');

const getFilms = (req, res, next) => {
  db.many('SELECT * FROM films;')
  .then(films => {
    res.send({ films });
  })
  .catch(next);
}

const postFilm = (req, res, next) => {
  const {genre} = req.body;
  db.one('SELECT genre_id FROM genres WHERE genre_name = $<genre>', {genre})
  .then(genre => {
    const {lead_actress} = req.body;
    return Promise.all([
      genre.genre_id,
      db.one('SELECT actress_id FROM actresses WHERE actress_name = $<lead_actress>', {lead_actress})
    ])
  })
  .then(([genre_id, actress]) => {
    const {name, year, poster_url, lead_character, lead_character_img_url, quote} = req.body;
    const actress_id = actress.actress_id;
    return db.one('INSERT INTO films (film_name, film_year, poster_url, genre_id, lead_character, lead_character_img_url, quote, lead_actress_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *', [name, year, poster_url, genre_id, lead_character, lead_character_img_url, quote, actress_id])
  })
  .then(film => {
    res.status(201).send({film})
  })
  .catch(next)
}

const getFilmByName = (req, res, next) => {
  const film = req.params.film;
  if(!/\w/.test(req.params.film)) throw {status: 400}
  db.one('SELECT * FROM films WHERE film_name = $<film>', {film})
    .then(film => {
      if (!film) throw { status: 404 }
      res.status(200).send({ film })
    })
  .catch(next)
}

const updateVote = (req, res, next) => {
  const film = req.params.film;
  if(!/\w/.test(req.params.film)) throw {status: 400}
  if(req.query.vote === 'up') {
    db.one('SELECT votes FROM films WHERE film_name = $<film>', {film})
    .then(votes => {
      if (!votes) throw { status: 404 }
      total = votes.votes + 1
      return db.one('UPDATE films SET votes = $1 WHERE film_name = $2 RETURNING *', [total, film])
    })
    .then(film => {
      res.status(200).send({film})
    })
    .catch(next)
  } else if (req.query.vote === 'down') {
    db.one('SELECT votes FROM films WHERE film_name = $<film>', {film})
    .then(votes => {
      if (!votes) throw { status: 404 }
      total = votes.votes - 1
      return db.one('UPDATE films SET votes = $1 WHERE film_name = $2 RETURNING *', [total, film])
    })
    .then(film => {
      res.status(200).send({film})
    })
    .catch(next)
  } else {
    throw {status: 400, msg: 'Bad request'}
  }
}

const deleteFilmByName = (req, res, next) => {
  const film = req.params.film;
  db.one('SELECT film_name FROM films WHERE film_name = $<film>', {film})
  .then(film => {
    if (!film) throw { status: 404 }
    const film_name = film.film_name
    return db.none('DELETE FROM films WHERE film_name = $<film_name>', {film_name})
  })
  .then(() => {
    res.status(200).send({ msg: 'film has been deleted' })
  })
  .catch(next)
}

const getActressByFilm = (req, res, next) => {
  const film = req.params.film;
  if(!/\w/.test(req.params.film)) throw {status: 400}
  db.one('SELECT lead_actress_id FROM films WHERE film_name = $<film>', {film})
  .then(id => {
    if (!id) throw { status: 404 }
    const actress_id = id.lead_actress_id
    return db.one('SELECT * FROM actresses WHERE actress_id = $<actress_id>', {actress_id})
  })
  .then(actress => {
    res.status(200).send({actress})
  })
  .catch(next)
}


module.exports = { getFilms, postFilm, getFilmByName, updateVote, deleteFilmByName, getActressByFilm };