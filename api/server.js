const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');
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

// Serve video thumbnail
app.get('/feed/:filename', (req, res) => {
  const file = req.params.filename;
  const filePath = path.join(__dirname, 'feed', file);
  console.log(filePath);
  
  res.sendFile(filePath, err => {
    if (err) res.status(404).send('Thumbnail not found');
  });
});

// Serve user photo
app.get('/user/:filename', (req, res) => {
  const file = req.params.filename;
  const filePath = path.join(__dirname, 'user', file);
  res.sendFile(filePath, err => {
    if (err) res.status(404).send('User photo not found');
  });
});



app.listen(3000, () => console.log('Server running on http://localhost:3000'));
