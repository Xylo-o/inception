FROM 		alpine:3.20.5

RUN apk update && apk add mariadb mariadb-client

COPY conf/mariadb.cnf /etc/my.cnf

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

VOLUME /var/lib/mysql

CMD ["mysqld"]