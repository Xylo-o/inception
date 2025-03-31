build:
	@echo -e "$(YELLOW)[Makefile]: $(NC)$(BLUE)Building services...$(NC)"
	docker compose -f srcs/docker-compose.yml build
	@echo -e "$(YELLOW)[Makefile]: $(NC)$(GREEN)Services build.$(NC)"

up:
	@echo -e "$(YELLOW)[Makefile]: $(NC)$(BLUE)Starting all services...$(NC)"
	docker compose -f srcs/docker-compose.yml up -d
	@echo -e "$(YELLOW)[Makefile]: $(NC)$(GREEN)Services started.$(NC)"
down:
	@echo -e "$(YELLOW)[Makefile]: $(NC)$(BLUE)Stopping services...$(NC)"
	docker compose -f srcs/docker-compose.yml down
	@echo -e "$(YELLOW)[Makefile]: $(NC)$(RED)Services stopped.$(NC)"

RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
NC := \033[0m