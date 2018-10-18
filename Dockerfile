FROM docker.registry:8123/centos:latest
MAINTAINER Andrew Partis (andrew.partis@accenture.com)

##dependencies
RUN yum install -y git gradle java
