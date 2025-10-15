# Base image with Python
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install dependencies
RUN python -m pip install --upgrade pip
RUN pip install --default-timeout=100 --no-cache-dir -r requirements.txt

# Expose a default port (8000)
EXPOSE 8000

# Start the FastAPI app, use $PORT if defined
CMD uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}
