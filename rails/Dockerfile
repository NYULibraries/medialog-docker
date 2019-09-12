FROM centos:latest

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.name="CentOS Base Image" \
    org.label-schema.vendor="CentOS" \
    org.label-schema.license="GPLv2" \
    org.label-schema.build-date="20190801"


RUN yum install -y which git postgresql postgresql-libs postgresql-contrib postgresql-devel autoconf automake bison bzip2 gcc-c++ libffi-devel libtool make patch readline-devel ruby sqlite-devel zlib-devel glibc-headers glibc-devel openssl-devel

COPY medialog /opt/medialog


RUN set -ex \
	&& groupadd --gid 333 medialog \
    && useradd --uid 333 --gid 333 medialog

RUN set -ex \
	&& chown -R medialog:medialog /opt/medialog

USER medialog

WORKDIR /opt/medialog

COPY scripts /opt/medialog/scripts
COPY config/*.yml /opt/medialog/config/

RUN scripts/install_rails.sh

ENTRYPOINT ["/opt/medialog/scripts/start_rails.sh"]