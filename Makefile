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

ipe_service_stop:
	@echo "Starting IPE service..."
	cd ipe
	@-pkill -SIGTERM -f ./ipe
	@echo "IPE service stopped!"

ipe_service_start:
	@echo "Stopping IPE service..."
	cd ipe && ./ipe &
	@echo "IPE service started!"

start: up ipe build_front
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

stop: down ipe_service_stop
	@echo "Stopping front end & services..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped front end!"