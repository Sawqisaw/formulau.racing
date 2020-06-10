#!/bin/sh
version=0.1
tag="hugo_build:$version"


docker build --tag $tag .

docker rm hugo_build

docker run --name hugo_build \
		   --mount \
type=bind,\
source="$(pwd)"/site-content,\
destination=/srv/build-site/site-content,\
consistency=cached \
		   --mount \
type=bind,\
source="$(pwd)"/public,\
destination=/srv/build-site/public,\
consistency=cached \
		   $tag
