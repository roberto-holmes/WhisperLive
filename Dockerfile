FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install python3 -y

# Copy over the WhisperLive repository
COPY . .

# Install all the WhisperLive requirements
RUN chmod +x scripts/setup.sh && scripts/setup.sh

# Run the WhisperLive server
RUN python3 run_server.py --port 9090 \
    --backend faster_whisper \
    --omp_num_threads 4