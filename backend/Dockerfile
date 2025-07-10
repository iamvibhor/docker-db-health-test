# ----- Stage 1: Builder -----
FROM node:18 AS builder

WORKDIR /app

# Install only deps first for caching
COPY package*.json ./
RUN npm install

# Copy app files
COPY . .

# ----- Stage 2: Final lightweight runtime -----
FROM node:18-slim


RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    postgresql-client \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=builder /app /app

RUN npm ci   

RUN chmod +x wait-for-db.sh
RUN useradd -m appuser
USER appuser

HEALTHCHECK --interval=10s --timeout=3s --start-period=20s --retries=5 \
  CMD curl --fail http://localhost:3000/health || exit 1

  
CMD ["./wait-for-db.sh"]


