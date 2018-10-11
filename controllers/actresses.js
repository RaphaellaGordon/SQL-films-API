const db = require('../db');

const getActresses = (req, res, next) => {
  db.many('SELECT * FROM actresses;')
  .then(actresses => {
    res.send({ actresses });
  })
  .catch(next);
}

const postActress = (req, res, next) => {
 const newActress = req.body;
 db.one('INSERT INTO actresses (actress_name, img_url) VALUES ($<name>, $<img_url>) RETURNING *;', newActress)
 .then(actress => {
    if (req.body.name.length < 3) throw {status: 400}
    res.status(201).send({actress})
    })
 .catch(next)
}

const getActressByName = (req, res, next) => {
  const actress = req.params.actress;
  if(Number(actress)) throw {status: 400}
  db.one('SELECT * FROM actresses WHERE actress_name = $<actress>', {actress})
    .then(actress => {
      if (!actress) throw { status: 404 }
      res.status(200).send({ actress })
    })
  .catch(next)
}

const getFilmByActress = (req, res, next) => {
  const actress = req.params.actress;
  if(Number(actress)) throw {status: 400}
  db.one('SELECT actress_id FROM actresses WHERE actress_name = $<actress>', {actress})
  .then(actress => {
    if (!actress) throw { status: 404 }
    const id = actress.actress_id
    return db.many('SELECT * FROM films WHERE lead_actress_id = $<id>', {id})
  })
  .then(films => {
    res.status(200).send({films})
  })
  .catch(next)
}

module.exports = { getActresses, getActressByName, postActress, getFilmByActress };