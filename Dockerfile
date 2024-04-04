# Use a Python base image
FROM python:3.9

# Install Jupyter notebook
RUN python3 -m pip install notebook

# Download ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

# Extract ngrok
RUN tar -xvf ngrok-v3-stable-linux-amd64.tgz

# Set ngrok authtoken (Replace '<your_ngrok_auth_token>' with your actual ngrok authentication token)
RUN ./ngrok authtoken 2ec4tCn7Ye2DqI7Xwqi3Y9xiiEv_3rYGwymMWVP8M8wTYpjqU

# Expose port 8888 for Jupyter notebook
EXPOSE 8888

# Start ngrok to expose port 8888 (Run in the background)
CMD ./ngrok http 8888 & python3 -m notebook --allow-root
