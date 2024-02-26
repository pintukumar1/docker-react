FROM node:12.22.12-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.17.4-alpine
EXPOSE 80
COPY /app/build /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
