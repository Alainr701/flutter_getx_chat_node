const promise = require('bluebird');
const options = {
    promiseLib: promise,
    query: (e) => {
        console.log('QUERY:', e.query);
    }
};

const pgp = require('pg-promise')(options);
const types = pgp.pg.types;
types.setTypeParser(1114 , function(stringValue) {
    return parseInt(stringValue);
} );

const databaseConfig = {
    host: '127.0.0.1',
    port: 5432,
    database: 'chat_db',
    user: 'postgres',
    password: '3127'
};

const db = pgp(databaseConfig);
module.exports = db;