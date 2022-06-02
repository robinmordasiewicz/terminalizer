FROM robinhoodis/ubuntu:latest

USER root
RUN apt-get update && apt-get install -y \
    curl \
    # X virtual framebuffer
    xvfb \
    # For Electron
    libgtk-3-0 libnss3 libasound2 \
    # For Terminalizer
    libxss1 libgconf-2-4 \
    # For gif manipulation
    gifsicle \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
#    && bash -c ". /root/.nvm/nvm.sh \
#    && nvm install 10 \
#    && nvm use 10 \
#    && npm install -g terminalizer --unsafe-perm=true --allow-root"



# Install npm (requires dependencies) - Ubuntu 20.04
RUN apt install npm node-gyp libnode-dev libnss3 librust-gdk-pixbuf-sys-dev libgtk-3-0 libxss1 libasound2 libgbm1

# Install terminalizer globally with unsafe permissions
RUN npm install -g terminalizer --unsafe-perm=true

# Grant global write access to render directory
RUN chmod 777 /usr/local/lib/node_modules/terminalizer/render/

WORKDIR /home/ubuntu
USER ubuntu:ubuntu

