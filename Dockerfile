FROM node:20-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY public ./public
EXPOSE 3000
CMD ["sh", "-c", "serve public -l 0.0.0.0:${PORT:-3000}"]
