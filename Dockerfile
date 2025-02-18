#
# Locust Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

LABEL org.opencontainers.image.authors="hihouhou < hihouhou@hihouhou.com >"

ENV LOCUST_VERSION=2.32.10

# Create locust user
RUN useradd -ms /bin/bash locust

# Installation de Python et pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Install Locust via pip3
RUN pip3 install locust

# Configure Locust
USER locust
WORKDIR /home/locust
COPY locustfile.py /home/locust/locustfile.py

# Exécution de Locust
CMD ["locust"]

