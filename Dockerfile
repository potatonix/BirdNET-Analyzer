# Build from Python slim
FROM --platform=linux/arm64 python:3.12

# Install required packages while keeping the image small
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg  && rm -rf /var/lib/apt/lists/*

# Import all scripts
COPY . .

# Install project dependencies and package
RUN pip install -r requirements.txt
RUN pip install .

# Verify execution
CMD ["python3", "-m", "birdnet_analyzer.network.server"]

# # Install PyInstaller
# RUN pip install pyinstaller

# # Build executable
# RUN pyinstaller \
#     --onefile \
#     --name birdnet_analyzer \
#     $(python -c "import birdnet_analyzer; print(birdnet_analyzer.__file__)")

# -----------------------------------------
# # Runtime stage (optional - minimal output)
# FROM --platform=linux/arm64 alpine:3.21

# # Copy only the compiled binary
# COPY --from=builder /app/dist/birdnet_analyzer /usr/local/bin/birdnet_analyzer/

# # Verify execution
# CMD ["python3", "birdnet_analyzer.network.server", "--help"]


# # Build stage
# FROM python:3.11-alpine AS builder

# # Install build dependencies
# RUN apk add --no-cache \
#     build-base \
#     libffi-dev \
#     openssl-dev

# # Install packaging tools
# RUN pip install --upgrade pip setuptools wheel

# # Copy project files
# WORKDIR /app
# COPY . .

# # Install project dependencies and package
# RUN pip install --user .

# # Install PyInstaller
# RUN pip install --user pyinstaller

# # Build executable
# RUN pyinstaller \
#     --onefile \
#     --name birdnet_analyzer \
#     $(python -c "import birdnet_analyzer; print(birdnet_analyzer.__file__)")

# # -----------------------------------------
# # Runtime stage (optional - minimal output)
# FROM alpine:3.21

# # Copy only the compiled binary
# COPY --from=builder /app/dist/birdnet_analyzer /usr/local/bin/birdnet_analyzer/

# # Verify execution
# CMD ["birdnet_analyzer", "--help"]
