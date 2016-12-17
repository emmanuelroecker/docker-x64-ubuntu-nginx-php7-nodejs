#!/bin/bash

docker rm -f glicer/scaleway-server
docker build -t glicer/scaleway-server .
