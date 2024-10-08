
FROM node:alpine AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build


FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 81



CMD ["nginx", "-g", "daemon off;"]

