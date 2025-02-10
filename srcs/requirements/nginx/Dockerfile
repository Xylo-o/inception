FROM		alpine:3.20.5

RUN			apk update && apk add	\
					openssl			\
					nginx			\
					curl			

COPY		./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE		443

CMD			["nginx", "-g", "daemon off;"]