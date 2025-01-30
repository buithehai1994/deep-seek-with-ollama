# Use an official lightweight Python image as the base
FROM python:3.10-slim

# Set environment variables
ENV OLLAMA_VERSION=0.1.26  # Change to the latest version if needed

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://ollama.com/install.sh | sh && \
    pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY api.py requirements.txt ./

# Expose the FastAPI port
EXPOSE 8000

# Start both Ollama and FastAPI
CMD ollama serve & uvicorn api:app --host 0.0.0.0 --port 8000
