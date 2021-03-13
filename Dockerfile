FROM node:alpine
WORKDIR "/usr/app"
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /usr/app/build /usr/share/nginx/html