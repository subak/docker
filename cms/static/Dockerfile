FROM subak/cms:latest
MAINTAINER Subak Systems <info@subak.jp>

RUN mkdir -m 700 -p .ssh \
 && echo "Host github.com\n\tStrictHostKeyChecking no\n" > .ssh/config \
 && echo "Host bitbucket.org\n\tStrictHostKeyChecking no\n" >> .ssh/config

COPY h2o.yml h2o.conf
COPY cms-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["cms-entrypoint.sh"]