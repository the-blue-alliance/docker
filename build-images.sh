#! /usr/bin/env bash
set -e

# For each directory, push each Dockerfile
for dir in $(ls -d */); do
    cd $dir
    REPO=the-blue-alliance/${dir:0:-1}
    echo "Building $REPO..."
    docker build -f Dockerfile -t $REPO:$COMMIT .
    cd ..
done
