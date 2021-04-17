FROM node:15.14.0-alpine3.11

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN git clone https://github.com/Rahul-Pandey7/react-image-compressor.git
WORKDIR react-image-compressor
RUN npm install

ENTRYPOINT [ "npm", "start" ]