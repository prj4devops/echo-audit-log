FROM nginx:stable

LABEL Name=audit-trail Version=0.0.1

COPY nginx.conf /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log && ln -sf /etc/localtime /usr/share/zoneinfo/localtime/Asia/Seoul
RUN mkdir -p /audit

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
