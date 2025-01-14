#!/bin/bash -e

## Dependency versions

v_sdk=11076708_latest
v_ndk=27.1.12297006
v_sdk_build_tools=35.0.0

v_mbedtls=3.6.2
v_libxml2=2.10.3
v_ffmpeg=7.1

## Dependency tree
# I would've used a dict but putting arrays in a dict is not a thing

dep_mbedtls=()
dep_ffmpeg=(libxml2 mbedtls)
