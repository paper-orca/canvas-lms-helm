#!/bin/bash
tag=$(cd canvas-lms && git describe --tags --abbrev=0 | sed 's|^release/||')
printf "Building image with tag: %s\n" $tag
docker buildx --platform linux/amd64 -f canvas-lms/Dockerfile.production -t canvas-lms:$tag canvas-lms
docker tag canvas-lms:$tag us-docker.pkg.dev/flapjack-t036-dev/docker/canvas-lms:$tag
docker tag canvas-lms:$tag us-docker.pkg.dev/flapjack-t036-dev/docker/canvas-lms:latest
docker push us-docker.pkg.dev/flapjack-t036-dev/docker/canvas-lms:$tag
docker push us-docker.pkg.dev/flapjack-t036-dev/docker/canvas-lms:latest
