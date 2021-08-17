#!/bin/bash
# start as root in container, but use userns-keep-id to properly map files
podman run \
    --rm \
    --tty \
    --interactive \
    --userns=keep-id \
    --user root:root \
    -e CONTAINERMANN_USER_ID=`id -u` \
    -e CONTAINERMANN_GROUP_ID=`id -g` \
    -v`pwd`:/data localhost/cntainmaux_deb:v0.1