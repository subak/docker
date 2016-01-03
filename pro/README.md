# subak/cms:pro

```
$ docker run -d --name ${NAME} \
  -e APP="${APP}" \
  -e ID_RSA="$(cat ~/.ssh/id_rsa)" \
  -e CONTENT_REPO="${CONTENT_REPO}" \
  -e ENGINE_REPO="${ENGINE_REPO}" \
  subak/cms:pro
```