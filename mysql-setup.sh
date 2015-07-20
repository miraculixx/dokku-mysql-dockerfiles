#!/bin/sh

# Keep upstart from complaining
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

apt-get update && apt-get install -y mysql-server && apt-get clean && rm -rf /var/lib/apt/lists/*

sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# http://dev.mysql.com/doc/refman/5.6/en/mysql-tzinfo-to-sql.html
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql
echo default-time-zone = 'UTC' >> /etc/mysql/my.cnf


/usr/sbin/mysqld &
sleep 5
echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'mysql-server' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql