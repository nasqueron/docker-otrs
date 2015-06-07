#!/bin/bash

# Initializes the container
if [ ! -f .initialized ]; then
	# Checks if we need to create the database 
	DB=`mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" -B -N -e "SHOW DATABASES LIKE '$DB_NAME';" 2>/dev/null`
	if [ "$DB" != "$DB_NAME" ]; then
		mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE ${DB_NAME}; CREATE USER 'otrs'@'%' IDENTIFIED BY 'otrs'; GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO 'otrs'@'%' WITH GRANT OPTION;"
		mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" $DB_NAME < /opt/otrs/scripts/database/otrs-schema.mysql.sql
		mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD" $DB_NAME < /opt/otrs/scripts/database/otrs-initial_insert.mysql.sql
		/opt/otrs/bin/otrs.SetPassword.pl --agent root@localhost yt7OgnRPZ2a45g8viz8iP3fec5yBDUpsWoNS6X8jL65a7dK0z5u0EMGrd5m2cf5
		sed -i "s/%%DATABASE%%/${DB_NAME}/" /opt/otrs/Kernel/Config.pm
	fi

	# Tasks to execute at every container creation
	/opt/otrs/bin/otrs.RebuildConfig.pl &
	touch .initialized
fi

# Runs services
/opt/otrs/bin/Cron.sh start otrs &
service httpd start
service crond start

# Stays foreground
while :
do
	sleep 1
done
