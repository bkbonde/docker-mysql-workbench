FROM ghcr.io/linuxserver/baseimage-rdesktop-web:arch

# set version label
ARG BUILD_DATE
ARG VERSION
ARG WORKBENCH_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# title
ENV TITLE=MySQLWorkbench

RUN \
  echo "**** install runtime packages ****" && \
  pacman -Sy --noconfirm --needed \
    mysql-workbench && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/* \
    /var/cache/pacman/pkg/* \
    /var/lib/pacman/sync/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
