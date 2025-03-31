FROM		alpine:3.20.5

# RUN			apk update && apk add	\
# 					openssl			\
# 					nginx			\
# 					curl	
					
# RUN			rm -rf /var/cache/apk/*

# RUN			chmod +x ./conf/cert.sh

# COPY		./conf/nginx.conf /etc/nginx/nginx.conf

# COPY 		./conf/certificate.crt /etc/ssl/certs/
# COPY 		./conf/cert_key.key /etc/ssl/private/

# EXPOSE		443

# CMD			["nginx", "-g", "daemon off;"]


RUN apk update && apk add --no-cache nginx openssl

# Create directories for certificates
RUN mkdir -p /etc/ssl/private /etc/ssl/certs

# Copy the certificate generation script and make it executable
COPY ./conf/cert.sh /tmp/
RUN chmod +x /tmp/cert.sh

# Generate SSL certificates
RUN /tmp/cert.sh

# Copy Nginx configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# Create directory for web files
RUN mkdir -p /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]