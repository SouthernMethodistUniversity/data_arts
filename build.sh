#!/usr/bin/env zsh

# Set version
version="latest"

# Build container with Docker
docker build -t data_arts:${version} .

# Convert Docker image to Singularity image
docker run -v /var/run/docker.sock:/var/run/docker.sock\
 -v $PWD:/output --privileged -t --rm\
 singularityware/docker2singularity data_arts:${version} | tee build.log

# Get Singularity image name
img_name=$(grep "Build complete:" build.log | tr -s ' ' | cut -d' ' -f5 | cut -d'/' -f3 | tr -d '\b\r')

# Change Singularity image permissions
sudo chown $USER:$USER $img_name

# Update module file with new Singularity image name
sed -i -e "/local img_name/c\local img_name      = \'${img_name}\'" data_arts.lua

