# subak/cms:static

```
$ docker run -d --name ${NAME} \
  -e ID_RSA="$(cat ~/.ssh/id_rsa)" \
  -e CONTENT_REPO="${CONTENT_REPO}" \
  -e APP_REPO="${APP_REPO}" \
  -e HTML_REPO="${HTML_REPO}" \
  subak/cms:static
```