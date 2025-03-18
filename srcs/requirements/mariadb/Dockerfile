FROM 		alpine:3.20.5

RUN apk update && apk add mariadb mariadb-client

COPY conf/mariadb.cnf /etc/my.cnf
COPY tools/init.sql.tpl /docker-entrypoint-initdb.d/init.sql.tpl
COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

VOLUME /var/lib/mysql

CMD ["mysqld"]