#! /usr/bin/env bash
set -e

# For each directory, push each Dockerfile
for dir in $(ls -d */); do
    cd $dir
    IMAGE=${dir:0:-1}
    REPO=the-blue-alliance/${dir:0:-1}
    echo "Building $REPO..."
    docker build -f Dockerfile -t $IMAGE .
    cd ..
done
