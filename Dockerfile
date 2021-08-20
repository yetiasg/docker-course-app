FROM node:alpine

WORKDIR /app
COPY package* .
RUN npm install
CMD ["npm", "run", "serve"]
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html