build:
	@echo "$(YELLOW)[Makefile]: $(NC)$(BLUE)Building services...$(NC)"
	docker compose -f srcs/docker-compose.yml build
	@echo "$(YELLOW)[Makefile]: $(NC)$(GREEN)Services build.$(NC)"

up:
	@echo "$(YELLOW)[Makefile]: $(NC)$(BLUE)Starting all services...$(NC)"
	docker compose up -d
	@echo "$(YELLOW)[Makefile]: $(NC)$(GREEN)Services started.$(NC)"
down:
	@echo "$(YELLOW)[Makefile]: $(NC)$(BLUE)Stopping services...$(NC)"
	docker compose down
	@echo "$(YELLOW)[Makefile]: $(NC)$(RED)Services stopped.$(NC)"

RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
NC := \033[0m