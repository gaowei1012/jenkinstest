# dockerfile
# build stage

FROM node:lts-alpine as build-stage

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# production stage

COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 6070

CMD ["nginx", "-g", "daemon off;"]