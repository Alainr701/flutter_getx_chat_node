const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);

const logger = require('morgan');
const cors = require('cors');

//RUTAS
const users = require('./routes/userRoutes');
//


const port = process.env.PORT || 3000;
app.set('port', port);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.disable('x-powered-by');

//CALL ROUTES
users(app);
//

server.listen(3000,'192.168.100.102'||'localhost', () => {
    console.log('Running server on port ' + port);
});

app.use((err, req, res, next) => {
        console.log(err);
        res.status(err.status||500).send(err.stack);
});
   
module.exports = {
    app,
    server
}