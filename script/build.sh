#!/bin/bash
tag=$(cd canvas-lms && git describe --tags --abbrev=0 | sed 's|^release/||')
printf "Building image with tag: %s\n" $tag
docker build -f canvas-lms/Dockerfile.production -t canvas-lms:$tag canvas-lms
docker tag canvas-lms:$tag ulevitsky/canvas-lms:$tag
docker tag canvas-lms:$tag ulevitsky/canvas-lms:latest
docker push ulevitsky/canvas-lms:$tag
docker push ulevitsky/canvas-lms:latest
