FROM python:3.11-alpine AS builder

RUN pip install --no-cache-dir mkdocs-material

WORKDIR /app

COPY config/mkdocs/mkdocs.yml /app/config/mkdocs/
COPY config/mkdocs/stylesheets /app/config/mkdocs/stylesheets/
COPY config/mkdocs/nginx.conf /app/config/mkdocs/
COPY docs /app/docs

WORKDIR /app

RUN mkdocs build --config-file config/mkdocs/mkdocs.yml

FROM nginx:alpine

COPY --from=builder /app/config/mkdocs/site /usr/share/nginx/html

COPY --from=builder /app/config/mkdocs/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
