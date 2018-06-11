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

ADD virtualgl_2.5.2_amd64.deb /
RUN dpkg -i /virtualgl_2.5.2_amd64.deb

# Copy VNC script that handles restarts
ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ENV USER=root X11VNC_PASSWORD=override

CMD ["/startvnc.sh"]

