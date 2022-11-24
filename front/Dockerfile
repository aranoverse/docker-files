FROM node:16.17.0-alpine3.16 as builder
RUN apk  -U --no-cache add git curl ca-certificates

WORKDIR /front

ADD package.json package-lock.json /front/
RUN npm install

ADD . /front
RUN npm run build


FROM nginx:alpine as front

COPY --from=builder /front/build/ /usr/share/nginx/html/
