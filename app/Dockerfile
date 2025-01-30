# Start with a Python base image
FROM python:3.11-slim AS base

# Install necessary dependencies
RUN apt-get update -y && apt-get install -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory for the application
ENV APP_HOME /app
WORKDIR $APP_HOME

# Copy the FastAPI application files
COPY . ./

# Install the required Python packages
RUN pip install -r requirements.txt

# Expose the port the FastAPI app will run on
EXPOSE 5005

# Command to run the application
CMD exec uvicorn app:app --host '0.0.0.0' --port 5005
