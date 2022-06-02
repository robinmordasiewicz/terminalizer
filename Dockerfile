FROM robinhoodis/ubuntu:latest

USER root
RUN touch ~/.bashrc && chmod +x ~/.bashrc

RUN apt-get update && apt-get install -y curl xvfb libgtk-3-0 libnss3 libasound2 libxss1 libgconf-2-4 gifsicle
RUN apt-get -y install node-gyp libnode-dev libnss3 librust-gdk-pixbuf-sys-dev libgbm1

# RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
# RUN apt-get install -y nodejs

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN . ~/.nvm/nvm.sh && source ~/.bashrc && nvm install node 10
RUN nvm use 10 
RUN npm install -g terminalizer --unsafe-perm=true --allow-root

# Install terminalizer globally with unsafe permissions
#RUN npm install -g terminalizer --unsafe-perm=true

RUN apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Grant global write access to render directory
#RUN chmod 777 /usr/local/lib/node_modules/terminalizer/render/
RUN find /usr/local/lib/node_modules/terminalizer/ -type d -exec chmod 777 {} \;
RUN chmod 4755 /usr/local/lib/node_modules/terminalizer/node_modules/electron/dist/chrome-sandbox

#RUN chmod 777 /usr/local/lib/node_modules/terminalizer/node_modules/

WORKDIR /home/ubuntu
USER ubuntu:ubuntu

