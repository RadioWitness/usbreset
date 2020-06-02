FROM ubuntu

MAINTAINER rhodey@anhonestefort.org

RUN apt update
RUN apt install -y libc-dev \
  libusb-dev \
  gcc

RUN mkdir /root/usbreset
WORKDIR /root/usbreset

ADD usbreset.c usbreset.c
RUN gcc usbreset.c -o usbreset

ENTRYPOINT ["./usbreset"]
