FROM python:3.11-slim AS base

# Install dependencies
RUN apt-get update -y && apt-get install -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
ENV APP_HOME /app
WORKDIR $APP_HOME

# Copy application code
COPY . ./

# Install required Python packages
RUN pip install -r requirements.txt

# Expose the application port
EXPOSE 5005

# Command to run FastAPI
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5005"]
