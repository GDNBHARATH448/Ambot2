FROM nikolaik/python-nodejs:python3.10-nodejs19

RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list \
 && sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg ca-certificates gnupg \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app/
RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD ["bash","start"]
