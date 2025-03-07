FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port used by web_server.py
EXPOSE 8080

# Use honcho to run all processes defined in the Procfile
CMD ["honcho", "start"]
