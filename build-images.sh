#! /usr/bin/env sh

# Set Up docker
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS

# For each directory, push each Dockerfile
for dir in $(ls -d */); do
    cd $dir
    echo "Building $dir"
    docker build -f Dockerfile -t $REPO:$COMMIT .
    cd ..
done
