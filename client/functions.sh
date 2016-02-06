#!/usr/bin/env bash

docker17() {
  cd
  docker-compose run --rm docker17 docker "${@}"
  cd ${OLDPWD}
}

docker18() {
  cd
  docker-compose run --rm docker18 docker "${@}"
  cd ${OLDPWD}
}

docker19() {
  cd
  docker-compose run --rm docker19 docker "${@}"
  cd ${OLDPWD}
}

docker110() {
  cd
  docker-compose run --rm docker110 docker "${@}"
  cd ${OLDPWD}
}

# default
docker() {
  docker19 "${@}"
}

docker1.19() {
  docker17 "${@}"
}

docker1.20() {
  docker18 "${@}"
}

docker1.21() {
  docker19 "${@}"
}

docker1.22() {
  docker110 "${@}"
}