# Use Python 3.9 slim base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install aria2 and other dependencies
RUN apt-get update && \
    apt-get install -y aria2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy all files from the repository
COPY . .

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make run.sh executable
RUN chmod +x run.sh

# Set the entrypoint to run.sh
ENTRYPOINT ["./run.sh"]
