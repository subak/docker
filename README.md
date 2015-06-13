# subak/samba-docker

```
$ docker run -d --name samba -e VOLUME=/var/www/html -e VOLUME_NAME=var_www_html -p 445:445 subak/samba
$ mount_smbfs smb://your.docker.host/html /path/to/html

$ docker run -d --name samba -v conf.d:/etc/samba/conf.d -p 445 subak/samba
$ docker run -d --name samba -p 445 subak/samba /usr/sbin/smbd -FS -s /path/to/smb.conf
```
