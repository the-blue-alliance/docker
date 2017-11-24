#! /usr/bin/env bash
set -e

# For each directory, build and tag each Dockerfile
for dir in $(ls -d */); do
    cd $dir
    IMAGE=${dir:0:-1}
    REPO=thebluealliance/$IMAGE
    echo "Building $REPO..."
    docker build -t $REPO .
    cd ..
done
