#!/bin/bash

# Start Ollama server in the background
ollama serve &

# Wait for Ollama server to start
sleep 5

# Pull the llama3.1 model
ollama pull llama3.1

# Wait for Ollama server to finish
wait $!
