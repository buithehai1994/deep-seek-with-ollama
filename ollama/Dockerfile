# Dockerfile in /ollama
FROM ubuntu:20.04

# Install necessary dependencies (you can adjust based on your needs)
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy Ollama-related files
COPY pull-llama3.sh /ollama/

# Make sure the script is executable
RUN chmod +x /ollama/pull-llama3.sh

# Set working directory to /ollama
WORKDIR /ollama

# Command to run the Ollama script
CMD ["./pull-llama3.sh"]
