const express = require('express');
const { Client } = require('pg');

const app = express();
const PORT = process.env.PORT || 3000;

const client = new Client({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME
});

client.connect()
  .then(() => console.log("🎉 Connected to Postgres"))
  .catch(err => console.error("❌ Failed to connect", err));

// Health check endpoint for Docker
app.get('/health', (req, res) => {
  res.status(200).send("OK");
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Backend running on port ${PORT}`);
});
