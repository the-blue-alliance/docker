#! /usr/bin/env bash
set -e

# Don't push builds from pull requests
if test "$TRAVIS_PULL_REQUEST" != "false" ; then
    echo "Skipping pushing images..."
    exit 0
fi

# Login to be able to push to docker hub
# These are set in encrypted travis vars
docker login --username=$DOCKER_USER --password=$DOCKER_PASS

# For each directory, build each Dockerfile
for dir in $(ls -d */); do
    cd $dir
    IMAGE=${dir:0:-1}
    REPO=thebluealliance/$IMAGE
    echo "Push $REPO..."
    docker push $REPO
    cd ..
done
