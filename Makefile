FRONT_END_BINARY=vigilate

build_front:
	@echo "Building front end binary..."
	env CGO_ENABLED=0 go build -o ${FRONT_END_BINARY} cmd/web/*.go
	@echo "Done!"

up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

down:
	@echo "Stopping Docker compose..."
	docker-compose down
	@echo "Done!"

test:
	@echo "Executing Tests..."
	cd internal/handlers && go test -v . &
	@echo "Testing Complete!"

start: up build_front
	@echo "Starting Docker container services"
	@echo "Starting IPE service
	@echo "Starting front end"
	./${FRONT_END_BINARY} \
		-dbuser='adam' \
		-dbpass='password' \
		-pusherHost='localhost' \
		-pusherKey='abc123' \
		-pusherSecret='123abc' \
		-pusherApp="1" \
		-pusherPort="4001" \
		-pusherSecure=false &

stop: down
	@echo "Stopping front end & services..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped front end!"