FROM alpine:3.5

ENV http_proxy http://10.27.1.201:8080
ENV https_proxy http://10.27.1.201:8080

RUN apk add --update nodejs
RUN apk add python python-dev py2-pip autoconf automake g++ make --no-cache

WORKDIR /var/openKB

COPY locales/ /var/openKB/locales/
COPY public/ /var/openKB/public/
COPY routes/ /var/openKB/routes/
COPY views/ /var/openKB/views/
COPY config/ /var/openKB/config/
COPY app.js /var/openKB/
COPY package.json /var/openKB/

RUN npm install

VOLUME /var/openKB/data

EXPOSE 4444
ENTRYPOINT ["npm", "start"]
