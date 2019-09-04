FROM centos:latest

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.name="CentOS Base Image" \
    org.label-schema.vendor="CentOS" \
    org.label-schema.license="GPLv2" \
    org.label-schema.build-date="20190801"

COPY entrypoint.sh /usr/local/entrypoint
RUN yum install -y which git postgresql postgresql-libs postgresql-contrib postgresql-devel autoconf automake bison bzip2 gcc-c++ libffi-devel libtool make patch readline-devel ruby sqlite-devel zlib-devel glibc-headers glibc-devel openssl-devel
RUN gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash
RUN git clone https://github.com/NYU-ACM/medialog /opt/medialog
COPY accounts.yml /opt/medialog/config/accounts.yml
COPY database.yml /opt/medialog/config/database.yml