FROM centos:centos6

MAINTAINER Tom Young <thomas.young@telogis.com>

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y gcc gcc-c++ flex bison runit

RUN yum clean all