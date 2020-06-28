## Phase 1
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## Phase 2
FROM nginx 
## We need to place content inside below path of ngnix
## There is no start up command for ngnix. It will start 
## automatically
COPY --from=builder /app/build /usr/share/nginx/html


