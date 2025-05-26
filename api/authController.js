const db = require("./db");
const bcrypt = require("bcryptjs");

// Register
exports.register = async (req, res) => {
  const { nama, email, password, tanggal_lahir } = req.body;
  if (nama || email || password || tanggal_lahir) {
    const hashedPassword = await bcrypt.hash(password, 10);

    db.query(
      "INSERT INTO users (nama, email, password, tanggal_lahir) VALUES (?, ?, ?, ?)",
      [nama, email, hashedPassword, tanggal_lahir],
      (err, result) => {
        if (err) return res.status(500).json({ error: err });
        res.json({
          message: "Registration successful",
          userId: result.insertId,
        });
      }
    );
  }
};
// Login
exports.login = (req, res) => {
  const { email, password } = req.body;
  console.log(req.body);

  db.query(
    "SELECT * FROM users WHERE email = ?",
    [email],
    async (err, results) => {
      if (err) return res.status(500).json({ error: err });

      if (results.length === 0) {
        return res.status(401).json({ message: "Email not found" });
      }

      const user = results[0];

      const match = await bcrypt.compare(password, user.password);
      if (!match) {
        return res.status(401).json({ message: "Wrong password" });
      }

      res.json({
        message: "Login successful",
        user: {
          id: user.id,
          nama: user.nama,
          email: user.email,
          tanggal_lahir: user.tanggal_lahir,
        },
      });
    }
  );
};
