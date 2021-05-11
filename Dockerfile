# Production Dockerfile
# Se necesita un docker de "multiples fases"

# Fase de Compilación
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Fase de Deploy
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
