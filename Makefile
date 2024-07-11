BINARY_NAME=greensage-backend
DOCKER_IMAGE=greensage-backend
MAIN_FILE=main.go

.PHONY: all build run clean docker-build docker-run

all: build

build:
	@echo "Building the application..."
	@go build -o $(BINARY_NAME) $(MAIN_FILE)

run: build
	@echo "Running the application..."
	@./$(BINARY_NAME)

clean:
	@echo "Cleaning up..."
	@rm -f $(BINARY_NAME)

docker-build:
	@echo "Building the Docker image..."
	@docker build -t $(DOCKER_IMAGE) .

docker-run:
	@echo "Running the Docker container..."
	@docker run -p 8080:8080 $(DOCKER_IMAGE)
