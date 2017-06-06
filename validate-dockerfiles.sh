#! /usr/bin/env sh
set -e

# For each directory in this repo, validate its Dockerfile
for dir in $(ls -d */); do
    dockerlint ${dir}Dockerfile
done
