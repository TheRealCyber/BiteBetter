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

# Install dependencies
RUN chmod +x ./build.sh && ./build.sh
RUN pip3 install -r requirements.txt

# Expose port 8000 (or your app's port)
EXPOSE 8000

# Command to run your app
CMD ["python", "app.py"]
