ENV ?= dev
ENV_FILE := .env.$(ENV)
COMPOSE = docker compose --env-file $(ENV_FILE)

up:
	$(COMPOSE) up --build -d

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f

restart:
	$(MAKE) down ENV=$(ENV)
	$(MAKE) up ENV=$(ENV)

ps:
	$(COMPOSE) ps
