#!/usr/bin/env zsh

# Set version
version="latest"

# Build container with Docker
docker build -t data_arts:${version} .

# Convert Docker image to Singularity image
docker run -v /var/run/docker.sock:/var/run/docker.sock\
 -v $PWD:/output --privileged -t --rm\
 singularityware/docker2singularity data_arts:${version}

