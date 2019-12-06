FROM centos:6

RUN rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-6-x86_64/pgdg-redhat-repo-latest.noarch.rpm

RUN yum install -y which git postgresql94-server postgresql94-libs postgresql94-contrib postgresql94-devel autoconf automake bison bzip2 gcc-c++ libffi-devel libtool make patch readline-devel ruby sqlite-devel zlib-devel glibc-headers glibc-devel openssl-devel

RUN service postgresql-9.4 initdb

COPY medialog /opt/medialog

COPY scripts /opt/medialog/scripts

COPY  config/*.yml /opt/medialog/config/

COPY config/pg_hba.conf /var/lib/pgsql/9.4/data

RUN set -ex \
	&& groupadd --gid 333 medialog \
    && useradd --uid 333 --gid 333 medialog

RUN set -ex \
	&& chown -R medialog:medialog /opt/medialog

USER medialog

WORKDIR /opt/medialog

RUN scripts/install_rails.sh

USER root