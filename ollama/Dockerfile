# Use the official Ollama image as base
FROM ollama/ollama

# Set the working directory
ENV APP_HOME=/home
WORKDIR $APP_HOME

# Copy the pull script and make it executable
COPY pull-llama3.sh .
RUN chmod +x pull-llama3.sh

# Start the Ollama server and pull the llama3.1 model
ENTRYPOINT ["/usr/bin/bash", "pull-llama3.sh"]
