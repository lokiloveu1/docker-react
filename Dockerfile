FROM node:16-alpine as builder
#builder is referring to "build" phrase

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
#expose port
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
