const app = require('express')();
const bodyParser = require('body-parser');
const apiRouter = require('./routes/api');
const { handle404s, handle400s, handle500s } = require('./errors')

app.use(bodyParser.json());

app.get('/', (req, res) => res.send('index'));

app.use('/api', apiRouter);

app.use(handle404s);
app.use(handle400s);
app.use(handle500s);

module.exports = app;