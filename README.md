# MySql Dockerfile

Dockerfiles for building a basic MySql server in a Docker container. Created for and used by [hughfletcher/dokku-mysql-plugin](https://github.com/hughfletcher/dokku-mysql-plugin), a Dokku plugin. For use with it see those docs.

To install without plugin:

    sudo docker build -t hughfletcher/mysql github.com/hughfletcher/dokku-mysql-dockerfiles

By default username is 'admin' and password is 'mysql-server'. But then you can do this and more...

    # Run the container and snag the id/ip
    $ ID=$(sudo docker run hughfletcher/mysql /usr/sbin/mysqld)
    $ IP=sudo docker inspect $ID | grep IPAddress | cut -d '"' -f 4

    # Config your db however
    $ sudo docker run hughfletcher/mysql mysqladmin -h $IP -u admin -p'mysql-server' password <password>
    $ sudo docker run hughfletcher/mysql mysqladmin -h $IP -u admin -p'mysql-server' create <db name>
    $ sudo docker run hughfletcher/mysql mysql -h $IP -u admin -p'mysql-server' -e "RENAME USER admin@'%' TO <new username>@'%';"

## Notes
* MySql server is created for use by other containers on the same host. No ports are exposed on the host.
* The MySql data directory is configured at `/opt/mysql` on the container for mounting a volume to the host.

## Todo
* Confirm data directory works and can be used persistantly.
* Tests

## Dependents/Uses
* [Docker](http://www.docker.io)
* [progrium/dokku](https://github.com/progrium/dokku) (only when used with plugin)
* [hughfletcher/dokku-mysql-plugin](https://github.com/hughfletcher/dokku-mysql-plugin) (only when used with plugin)

## Thanks
* [kstaken/dockerfile-examples](https://github.com/kstaken/dockerfile-examples)
* [Installing MariaDB/MySQL with Docker](http://amattn.com/2013/08/29/installing_maria_db_mysql_with_docker.html)