docker-build:
	@echo "Building BirdNET-Analyzer Docker image..."
	@docker build -t birdnet-analyzer:latest .
	@echo "Docker image built."

docker-run:
	@echo "Running BirdNET-Analyzer Docker container..."
	@docker run --rm -p 8080:8080 birdnet-analyzer:latest
	@echo "Docker container stopped."

run-server:
	@echo "Starting BirdNET-Analyzer server..."
	@python3 -m birdnet_analyzer.network.server
	@echo "Server stopped."
