#!/bin/bash -e

. ./include/depinfo.sh

[ -z "$WGET" ] && WGET=wget

mkdir -p deps && cd deps

# mbedtls
while true; do
    rm -rf mbedtls
    if git clone --depth 1 --branch v$v_mbedtls --recurse-submodules https://github.com/Mbed-TLS/mbedtls.git mbedtls; then
        break
    else
        sleep 5
    fi
done

# libxml2
while true; do
    rm -rf libxml2
    if git clone --depth 1 --branch v$v_libxml2 --recursive https://gitlab.gnome.org/GNOME/libxml2.git libxml2; then
        break
    else
        sleep 0.4
    fi
done

# ffmpeg
while true; do
    rm -rf ffmpeg
    if git clone --depth 1 --branch n$v_ffmpeg https://github.com/FFmpeg/FFmpeg.git ffmpeg; then
        break
    else
        sleep 5
    fi
done

cd ..
