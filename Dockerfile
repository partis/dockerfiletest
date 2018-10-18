FROM centos:latest
MAINTAINER Andrew Partis (andrew.partis@accenture.com)

##dependencies
RUN yum install -y git gradle java
