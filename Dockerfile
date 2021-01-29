FROM node:15.7.0-alpine3.10 as build
WORKDIR /home
COPY . .
RUN npm run validate_apps && npm run build

FROM nginx
COPY --from=build /home/dist /usr/share/nginx/html
