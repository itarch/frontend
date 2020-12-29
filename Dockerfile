# first phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second phase
FROM nginx

# third phase (2b)
COPY --from=builder /app/build /usr/share/nginx/html
