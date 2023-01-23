const UserController = require('../controllers/usersController');

module.exports = (app) => {
    app.post('/api/users/create', UserController.create);
    app.get('/api/users/getAll', UserController.getAll);
};