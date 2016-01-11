FROM centos:latest
MAINTAINER http://www.centos.org
LABEL Vendor="CentOS"
LABEL License=GPLv2
LABEL Version=2.4.6-31
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && yum clean all
COPY remi*  /etc/yum.repos.d/
RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all
RUN yum -y install php  && yum clean all
RUN yum -y install php-mbstring &&  yum clean all
RUN yum -y install gd mbstring pdo pdo_mysql pdo_pgsql zip  &&  yum clean all
RUN yum -y install php-mysql &&  yum clean all
RUN yum -y install php-intl php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap  &&  yum clean all
RUN yum -y install procps &&  yum clean all
RUN yum -y install wget unzip && yum clean all
RUN yum -y install php-pecl-zendopcache --enablerepo=remi && yum clean all

RUN curl -fSL "https://github.com/drush-ops/drush/releases/download/8.0.0-rc3/drush.phar" -o drush.phar \
    && php drush.phar core-status \
    && chmod +x drush.phar \
    && mv drush.phar /usr/local/bin/drush \
    && drush init

VOLUME /var/www/html
COPY php.ini /etc/
EXPOSE 80 443

# Simple startup script to avoid some issues observed with container restart 
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
