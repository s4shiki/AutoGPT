setup:
	@if [ ! -f autogpts/autogpt/.env ]; then \
		cp autogpts/autogpt/.env.template autogpts/autogpt/.env; \
	fi

start-serve: setup
	docker-compose -f autogpts/autogpt/docker-compose.yml build auto-gpt
	docker-compose -f autogpts/autogpt/docker-compose.yml run --service-ports auto-gpt serve

start-web:
	docker-compose -f frontend/docker-compose.yml up --build