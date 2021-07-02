PROJECT_NAME="revivalmc-dev"

COMPOSE=docker-compose -f ./src/docker-compose.yml -p $(PROJECT_NAME)

all: server-data postgres-data
	@$(COMPOSE) up -d --build

server-data:
	@mkdir -p ./src/server-data
	@ln -sf ./src/server-data .

postgres-data:
	@mkdir -p ./src/postgres-data
	@ln -sf ./src/postgres-data .

status:
	@$(COMPOSE) ps

log:
	@$(COMPOSE) logs

logs: log

clean:
	@$(COMPOSE) down

fclean:
	@$(COMPOSE) down -v  --remove-orphans

help:
	@printf "\033[1;38mRevivalMC Dev Environment - Help\n\033[0m"
	@printf "make status: informations about the currently running containers\n"
	@printf "make fclean: shutdown the dev cluster\n"
	@printf "make logs: output main cluster logs\n"

re: fclean all

.PHONY: all clean fclean re status log logs
