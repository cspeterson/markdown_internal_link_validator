FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
ENV BUNDLE_PATH=vendor

RUN apt-get update && \
  apt-get -y install wget
RUN wget -O /tmp/pandoc.deb https://github.com/jgm/pandoc/releases/download/2.13/pandoc-2.13-1-amd64.deb
RUN apt-get --yes install /tmp/pandoc.deb
RUN apt-get update && apt-get --yes install \
  coreutils \
  git \
  jq \
  make \
  shunit2


WORKDIR /src

ENTRYPOINT [ "make" ]
CMD [ "all" ]
