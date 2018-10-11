const DB = require('./config')

const pgp = require('pg-promise')({ promiseLib: Promise });
module.exports = pgp(DB);