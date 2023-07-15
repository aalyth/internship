#!/bin/sh

# builds the CI Docker agents, used by Jenkins
docker build -t aalyth/ci-backend ./backend
docker build -t aalyth/ci-frontend ./frontend

docker image push aalyth/ci-backend
docker image push aalyth/ci-frontend
