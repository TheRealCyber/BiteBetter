# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies (libgl1, libglib2.0-0, etc.)
RUN apt-get update && apt-get install -y \
    libgl1 libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /app
COPY . .

# Install Poetry and dependencies
RUN pip install poetry==1.7.1
RUN poetry install --no-dev

# Expose port 8000 (or your app's port)
EXPOSE 8000

# Command to run your app
CMD ["poetry", "run", "python", "app.py"]
