ablogcms-docker
===============

A Dockerfile that installs the latest a-blog cms.

## Installation

```
$ git clone https://github.com/subak/ablogcms-docker.git
$ cd ablogcms-docker
$ docker build -t acms:latest .
$ docker pull mysql:latest
```

## Usage

```
$ docker run --name mysql-server -e MYSQL_ROOT_PASSWORD=root -d mysql
$ docker run --name acms --link mysql-server:mysql -p 80:80 -d acms:latest
```
