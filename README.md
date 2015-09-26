# dnsmasq
```
$ docker run --name dns --rm -ti --cap-add=NET_ADMIN -p 53:53/tcp -p 53:53/udp subak/dnsmasq -h -R -S 8.8.8.8 -A /mydomain/192.168.1.1
```
