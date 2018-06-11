#FROM neurodebian:xenial
FROM ubuntu:16.04
MAINTAINER Soichi Hayashis <hayashis@iu.edu>

# Install LXDE, VNC server, XRDP
#RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
#   xvfb x11vnc vim lxde-core lxde-icon-theme lxterminal

EXPOSE 5900

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xvfb x11vnc vim \
    lxde-core lxde-icon-theme lxterminal \
    mesa-utils libgl1-mesa-dri curl unzip

COPY mricrogl_linux.zip .
RUN unzip mricrogl_linux.zip -d /
RUN ls /mricrogl_lx #check

ADD vnc.sh /opt
CMD ["/opt/vnc.sh"]

# Install autostart file for mricrogl
RUN mkdir -p /root/.config/autostart
ADD app.desktop /root/.config/autostart

