FROM ubuntu:12.04

MAINTAINER Hugh Fletcher

ADD ./mysql-setup.sh /tmp/mysql-setup.sh
RUN /bin/sh /tmp/mysql-setup.sh

CMD ["/usr/sbin/mysqld"]