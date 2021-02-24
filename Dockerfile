FROM node:10-alpine

WORKDIR /usr/app

COPY package.json .
RUN npm install

COPY . .
CMD npm run build

FROM nginx
# Elastic beanstalk will map container port to 80 for http trafic
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html