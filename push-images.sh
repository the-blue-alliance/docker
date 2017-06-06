#! /usr/bin/env bash
set -e

# Set Up docker
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS

# For each directory, push each Dockerfile
for dir in $(ls -d */); do
    cd $dir
    IMAGE=${dir:0:-1}
    REPO=the-blue-alliance/$IMAGE
    TAG=latest
    echo "Pushing $REPO:$TAG @ $COMMIT..."
    docker tag $IMAGE $REPO:$COMMIT
    docker tag $IMAGE $REPO:$TAG
    docker tag $IMAGE $REPO:travis-$TRAVIS_BUILD_NUMBER
    docker push $REPO
    cd ..
done
