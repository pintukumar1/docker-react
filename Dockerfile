FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

ENV  TZ=Asia/Kolkata

FROM nginx
EXPOSE 80
ENV TZ=Asia/Kolkata
COPY --from=builder /app/build /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
