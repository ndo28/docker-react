# Build stage
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn build


# Serve stage
FROM nginx as server
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html