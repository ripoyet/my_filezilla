FROM consol/ubuntu-xfce-vnc:latest
MAINTAINER rafaelesku

RUN apt-get -qq update && \
    apt-get -q -y upgrade && \
    apt-get install -y sudo curl wget locales && \
    rm -rf /var/lib/apt/lists/*

# Ensure that we always use UTF-8 and with Spanish locale
RUN locale-gen es_ES.UTF-8

COPY ./default_locale /etc/default/locale
RUN chmod 0755 /etc/default/locale

ENV LC_ALL es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES.UTF-8
VOLUME /root/Downloads
