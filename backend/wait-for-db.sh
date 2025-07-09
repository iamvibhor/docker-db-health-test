#!/bin/sh

echo "⏳ Waiting for DB to be ready..."

until pg_isready -h "$DB_HOST" -p 5432; do
  sleep 1
done

echo "✅ DB is ready! Starting app..."
exec node app.js
