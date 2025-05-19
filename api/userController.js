const db = require('./db');

// Get all users
exports.getUsers = (req, res) => {
  db.query('SELECT * FROM users', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
};

// Add new user
exports.addUser = (req, res) => {
  const { nama, email, password, tanggal_lahir } = req.body;
  db.query(
    'INSERT INTO users (nama, email, password, tanggal_lahir) VALUES (?, ?, ?, ?)',
    [nama, email, password, tanggal_lahir],
    (err, result) => {
      if (err) return res.status(500).json({ error: err });
      res.json({ message: 'User added', id: result.insertId });
    }
  );
};

// Edit user
exports.editUser = (req, res) => {
  const { id } = req.params;
  const { nama, email, password, tanggal_lahir } = req.body;
  db.query(
    'UPDATE users SET nama=?, email=?, password=?, tanggal_lahir=? WHERE id=?',
    [nama, email, password, tanggal_lahir, id],
    (err) => {
      if (err) return res.status(500).json({ error: err });
      res.json({ message: 'User updated' });
    }
  );
};

// Delete user
exports.deleteUser = (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM users WHERE id = ?', [id], (err) => {
    if (err) return res.status(500).json({ error: err });
    res.json({ message: 'User deleted' });
  });
};

// Find user by ID
exports.getUserById = (req, res) => {
  const { id } = req.params;
  db.query('SELECT * FROM users WHERE id = ?', [id], (err, results) => {
    if (err) return res.status(500).json({ error: err });
    if (results.length === 0) return res.status(404).json({ message: 'User not found' });
    res.json(results[0]);
  });
};

// Search user by name or email
exports.searchUsers = (req, res) => {
  const q = `%${req.query.q}%`;
  db.query(
    'SELECT * FROM users WHERE nama LIKE ? OR email LIKE ?',
    [q, q],
    (err, results) => {
      if (err) return res.status(500).json({ error: err });
      res.json(results);
    }
  );
};

