# Use an official lightweight Python image
FROM python:3.10-slim

# Set environment variables
ENV OLLAMA_VERSION=0.1.26  

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl unzip && \
    curl -fsSL https://github.com/ollama/ollama/releases/download/v0.1.26/ollama-linux-amd64-v0.1.26.tar.gz -o /ollama.tar.gz && \
    tar -xzvf /ollama.tar.gz -C /usr/local/bin && \
    rm /ollama.tar.gz

# Copy only the necessary files
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Copy the application code into the container
COPY app /app

# Expose the FastAPI port
EXPOSE 8000

# Start both Ollama and FastAPI
CMD /usr/local/bin/ollama serve & uvicorn app.api:app --host 0.0.0.0 --port 8000
