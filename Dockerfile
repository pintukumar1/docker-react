FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run start

FROM nginx
EXPOSE 3000
COPY --from=0 /app/build /usr/share/nginx/html
