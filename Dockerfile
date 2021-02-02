FROM node:15.7.0-alpine3.10 as build
WORKDIR /home
COPY . .
RUN npm install --production
RUN npm run validate_apps && npm run build
RUN ls dist

FROM nginx
COPY --from=build /home/dist /usr/share/nginx/html
RUN ls /usr/share/nginx/html
