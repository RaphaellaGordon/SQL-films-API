process.env.NODE_ENV = process.env.NODE_ENV || 'development';

const development = {
  host: 'localhost',
  port: 5432,
  database: 'female_leads'
};

const test = {
  host: 'localhost',
  port: 5432,
  database: 'female_leads_test'
};

const config = { development, test };

module.exports = config[process.env.NODE_ENV];