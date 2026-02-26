FROM node:20-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY public ./public
EXPOSE 3000
ENV PORT=3000
CMD ["npx", "serve", "public", "-l", "3000"]
