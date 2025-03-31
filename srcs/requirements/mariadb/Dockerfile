FROM alpine:3.20.5

RUN apk update && apk add --no-cache mariadb mariadb-client gettext

COPY ./conf/mariadb.cnf /etc/my.cnf
COPY ./tools/init.sql.tpl /docker-entrypoint-initdb.d/init.sql.tpl
COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Create necessary directories with permissions
RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql && \
    chmod 777 /run/mysqld

# Initialize the mariadb data directory
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

VOLUME /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/entrypoint.sh"]