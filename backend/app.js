const { Client } = require('pg');

const client = new Client({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME
});

client.connect()
  .then(() => console.log("🎉 Connected to Postgres"))
  .catch(err => console.error("❌ Failed to connect", err));
