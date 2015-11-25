FROM node:0.12-onbuild

RUN npm install -g ws
ENV NODE_PATH /usr/local/lib/node_modules

