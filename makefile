ENV ?= dev
ENV_FILE := .env.$(ENV)
COMPOSE = docker compose --env-file $(ENV_FILE)

up:
	$(COMPOSE) up --build -d

build:
	docker build -t backend:latest backend/

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f

restart:
	$(MAKE) down ENV=$(ENV)
	$(MAKE) up ENV=$(ENV)

ps:
	$(COMPOSE) ps

scan:
	trivy image --severity HIGH,CRITICAL backend:latest

healthcheck:
	curl --fail http://localhost:3000/health || echo "Unhealthy"
