FROM robinhoodis/ubuntu:latest

USER root
RUN apt-get update && apt-get install -y curl xvfb libgtk-3-0 libnss3 libasound2 libxss1 libgconf-2-4 gifsicle

#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
#    && bash -c ". /root/.nvm/nvm.sh \
#    && nvm install 10 \
#    && nvm use 10 \
#    && npm install -g terminalizer --unsafe-perm=true --allow-root"


# RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
# RUN apt-get install -y nodejs


# Install npm (requires dependencies) - Ubuntu 20.04
RUN apt-get -y install npm node-gyp libnode-dev libnss3 librust-gdk-pixbuf-sys-dev libgbm1

# Install terminalizer globally with unsafe permissions
RUN npm install -g terminalizer --unsafe-perm=true

RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Grant global write access to render directory
RUN chmod 777 /usr/local/lib/node_modules/terminalizer/render/

WORKDIR /home/ubuntu
USER ubuntu:ubuntu

