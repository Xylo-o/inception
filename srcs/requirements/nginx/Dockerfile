FROM		alpine:3.20.5

RUN			apk update && apk add	\
					openssl			\
					nginx			\
					curl	
					
RUN			rm -rf /var/cache/apk/*

RUN			./conf/cert.sh

COPY		./conf/nginx.conf /etc/nginx/nginx.conf

COPY 		./conf/certificate.crt /etc/ssl/certs/
COPY 		./conf/cert_key.key /etc/ssl/private/

EXPOSE		443

CMD			["nginx", "-g", "daemon off;"]