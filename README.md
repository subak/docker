# storage-docker


## How to use
```
# backup
$ docker run --name storage_container --volumes-from some_volume_container subak/storage backup /var/www/html /var/lib/mysql
$ docker export storage_container > storage.tar
$ docker rm storage_container

# restore
$ cat storage.tar | docker import - storage_image
$ docker run --rm --volumes-from some_volume_container storage_image restore /var/www/html /var/lib/mysql
$ docker rmi storage_image
```

## with docker compose
```
# before restore you have to up volume container
$ docker-compose up -d storage
```
