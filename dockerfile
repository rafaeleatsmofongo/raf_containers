# Use an Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages for Firefox
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    bzip2 \
    libasound2 \
    libx11-xcb1 \
    libdbus-glib-1-2 \
    libxtst6 \
    libxrender1 \
    libgtk-3-0 \
    libatomic1 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libxext6 \
    libxshmfence1 \
    libglu1-mesa \
    libgl1-mesa-glx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download and extract Firefox from Mozilla
RUN wget -O /tmp/firefox.tar.bz2 'https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US' \
    && tar -xjf /tmp/firefox.tar.bz2 -C /opt/ \
    && ln -s /opt/firefox/firefox /usr/bin/firefox \
    && rm /tmp/firefox.tar.bz2

# Set the default command to run Firefox
CMD ["firefox"]
