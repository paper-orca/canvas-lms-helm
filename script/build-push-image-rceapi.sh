#!/bin/bash
docker build -f canvas-rce-api/Dockerfile -t canvas-rce-api canvas-rce-api
docker tag canvas-rce-api ulevitsky/canvas-rce-api:latest
docker push ulevitsky/canvas-rce-api:latest
