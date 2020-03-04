# Use the official Python docker image for latest version.
FROM python:3.8-slim

# Set the working directory.
WORKDIR /app

# Copy and install Python dependencies.
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy rest of source code over.
COPY . .

# Run nginx
RUN apt-get update && apt-get install -y nginx

# Install and run supervisor
RUN apt-get install -y supervisor
CMD ["supervisord", "-c", "supervisord.conf"]

