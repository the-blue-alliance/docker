#! /usr/bin/env sh

# Set Up docker
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS

# For each directory, push each Dockerfile
for dir in $(ls -d */); do
    cd $dir
    REPO=the-blue-alliance/${dir:0:-1}
    TAG=latest
    echo "Pushing $REPO:$TAG @ $COMMIT..."
    docker tag $REPO:$COMMIT $REPO:$TAG
    docker tag $REPO:$COMMIT $REPO:travis-$TRAVIS_BUILD_NUMBER
    docker push $REPO
    cd ..
done
