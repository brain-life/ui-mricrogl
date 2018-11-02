FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER Soichi Hayashis <hayashis@iu.edu>

EXPOSE 5900
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y vim mesa-utils tightvncserver xfce4 wmctrl unzip
RUN apt-get remove -y xfce4-panel

COPY mricrogl_linux.zip .
RUN unzip mricrogl_linux.zip -d /

#ADD virtualgl_2.5.2_amd64.deb /
#RUN dpkg -i /virtualgl_2.5.2_amd64.deb
ADD virtualgl_2.6_amd64.deb /
RUN dpkg -i /virtualgl_2.6_amd64.deb

# Copy VNC script that handles restarts
ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ENV USER=root X11VNC_PASSWORD=override

CMD ["/startvnc.sh"]

