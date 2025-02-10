FROM		alpine:3.20.5

RUN			apk update && apk add	\
					openssl			\
					nginx			\
					curl			

COPY		./conf/nginx.conf /etc/nginx/nginx.conf

COPY		tools/setup_nginx.sh /setup_nginx.sh

RUN			chmod +x /setup_nginx.sh

EXPOSE		443

ENTRYPOINT	["sh", "setup_nginx.sh"]