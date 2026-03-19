FROM debian:trixie-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt update; \
    apt install -y --no-install-recommends \
        cmake \
        graphviz \
        libgraphviz-dev \
        libcairo2-dev \
        libgirepository-2.0-dev \
        ca-certificates \
        libssl3 \
        python3-pip \
        python3-setuptools \
        python3-dev \
        python3-gi \
        python3-gst-1.0 \
        build-essential \
        libgstreamer1.0-dev \
        libgstreamer-plugins-base1.0-dev \
        gstreamer1.0-tools \
        gstreamer1.0-pulseaudio \
        gstreamer1.0-plugins-base \
        gstreamer1.0-plugins-good; \
    rm -rf /var/lib/apt/lists/*
