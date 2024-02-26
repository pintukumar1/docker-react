FROM node:16-alpine as builder

ENV PORT=3000

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
EXPOSE ${PORT}
CMD [ "npm", "start"]

FROM nginx:1.22.1
COPY --from=0 /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
