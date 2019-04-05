# docker build -f Dockerfile.pro .
# docker build -t eraarby/reactweb:latest -f Dockerfile.dev .
# docker run eraarby/reactweb
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html