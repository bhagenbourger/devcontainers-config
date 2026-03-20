FROM debian:trixie-slim AS builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    git build-essential pkg-config curl clang \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libssl-dev

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN git clone --depth 1 https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git /src
WORKDIR /src
RUN cargo build --package gst-plugin-spotify --release

FROM debian:trixie-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt update; \
    apt install -y --no-install-recommends \
        cmake \
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

COPY --from=builder /src/target/release/libgstspotify.so /usr/lib/x86_64-linux-gnu/gstreamer-1.0/
