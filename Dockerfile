FROM node:10-alpine

WORKDIR /usr/app

COPY package.json .
RUN npm install

COPY . .
CMD npm run build

FROM nginx
COPY --from=0 /usr/app/build /usr/share/nginx/html