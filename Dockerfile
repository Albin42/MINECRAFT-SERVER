# Use a Python base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Install Python packages and ngrok
RUN python3 -m pip install notebook && \
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xvf ngrok-v3-stable-linux-amd64.tgz && \
    ./ngrok authtoken <your_ngrok_auth_token>

# Expose port 8888 for Jupyter notebook
EXPOSE 8888

# Start Jupyter notebook server
CMD ["python3", "-m", "notebook", "--allow-root"]
