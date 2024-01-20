FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
LABEL author="Woolf"
LABEL author_email="woolf24@protonmail.com"
LABEL author_gitlab="https://gitlab.com/woolf/RTSPbrute"
LABEL description="Tool for RTSP that brute-forces routes and credentials, makes screenshots!"

ARG RTSPBRUTE_GIT_URL=https://gitlab.com/woolf/RTSPbrute.git

RUN apt-get update && apt-get install -y \
        python3-dev \
        python3-setuptools \
        python3-pip \
        git \
        pkg-config \
        libjpeg-dev \
        zlib1g-dev \
        ffmpeg \
        libavcodec-dev \
        libavdevice-dev \
        libavfilter-dev \
        libavformat-dev \
        libavutil-dev \
        libswresample-dev \
        libswscale-dev
RUN pip3 install rtspbrute
RUN mkdir /RTSPbrute
ENTRYPOINT ["/usr/local/bin/rtspbrute"]
CMD [""]
WORKDIR /RTSPbrute