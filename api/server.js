const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const userController = require('./userController');
const authController = require('./authController');

const app = express();
app.use(cors());
app.use(express.json())

app.get('/users', userController.getUsers);
app.post('/users', userController.addUser);
app.put('/users/:id', userController.editUser);
app.delete('/users/:id', userController.deleteUser);
app.get('/users/:id', userController.getUserById);
app.get('/users/search', userController.searchUsers);

app.post('/auth/register', authController.register);
app.post('/auth/login', authController.login);



app.listen(3000, () => console.log('Server running on http://localhost:3000'));
