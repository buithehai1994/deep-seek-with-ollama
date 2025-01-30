#!/bin/bash
set -e

echo "Starting Ollama server..."
ollama serve &
sleep 2  # Wait for the server to start

echo "Ollama server is running. Ready to accept requests."

# Keep the container running
tail -f /dev/null
