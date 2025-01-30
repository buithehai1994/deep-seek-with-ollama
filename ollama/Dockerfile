# Use the official Ollama image as the base
FROM ollama/ollama

# Set the working directory inside the container
WORKDIR /root

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Ensure the script has execution permissions
RUN chmod +x /entrypoint.sh

# Expose Ollama API port
EXPOSE 11434

# Set the entrypoint script as the default command
ENTRYPOINT ["/entrypoint.sh"]
