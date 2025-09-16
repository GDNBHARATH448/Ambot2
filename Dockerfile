FROM nikolaik/python-nodejs:python3.10-nodejs19

# Install ffmpeg and clean up apt cache
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg ca-certificates gnupg \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
WORKDIR /app
COPY . /app/

# Install Python deps
RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD ["bash", "start"]
