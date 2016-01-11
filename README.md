dockerfiles-centos-httpd
========================

CentOS  dockerfile for php and drush for install drupal 

Get Docker version

```
# docker version
```

To build:

Copy the sources down and do the build-

```
# docker build --rm -t <username>/php .
```

To run (if port 80 is open on your host):

```
# docker run -d -p 80:80 <username>/php
```

or to assign a random port that maps to port 80 on the container:

```
# docker run -d -p 80 <username>/php
```

Initialize a new ~/var/www/html

# docker run --rm=true --volumes-from=~/var/www/html  <username>/php

Run the current /var/www/html

#  docker run -d --volumes-from=~/var/www/html <username>/php

To the port that the container is listening on:

```
# docker ps
```

To test:

```
# curl http://localhost
```
