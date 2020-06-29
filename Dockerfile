## Phase 1
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## Phase 2
## We need to place content inside below path of ngnix
## There is no start up command for ngnix. It will start 
## automatically
FROM nginx 
## Expose port is is for EBS to open up firewall
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


