FROM alpine:3.20.5

RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /etc/ssl/private /etc/ssl/certs

COPY ./conf/cert.sh /tmp/
RUN chmod +x /tmp/cert.sh

RUN /tmp/cert.sh

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]