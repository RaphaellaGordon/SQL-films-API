const pgp = require('pg-promise')
const QRE = pgp.errors.QueryResultError;
const qrec = pgp.errors.queryResultErrorCode.noData;

exports.handle404s = (err, req, res, next) => {
  if ((err instanceof QRE && err.code === qrec) || err.status === 404) {
    res.status(404).send({ msg: 'Not found' })
  }
  else next(err);
}

exports.handle400s = (err, req, res, next) => {
  if (err.code === '22P02' || err.code === '23502' || err.status === 400) {
    res.status(400).send({ msg: err.message || 'Bad request' })
  }
  else next(err)
}

exports.handle500s = (err, req, res, next) => {
  console.log(err)
  res.status(500).send('Internal server error');
}