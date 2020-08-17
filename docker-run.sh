#!/bin/bash

detach="-d"
#detach=""

# Default profiles for all
docker run $detach --rm --name broker -p 8002:8002 -p 7002:7002  broker:0.0.1-SNAPSHOT
docker run $detach --rm --name pong --env BROKER_HOST=host.docker.internal pong:0.0.1-SNAPSHOT
docker run $detach --rm --name ping --env BROKER_HOST=host.docker.internal ping:0.0.1-SNAPSHOT

#if [[ "$1" == 1 ]]; then
  # Pong as server (no broker)
#  docker run $detach --rm --name pong --env SPRING_PROFILES_ACTIVE=server pong:0.0.1-SNAPSHOT
#  docker run $detach --rm --name pong --env BROKER_HOST=host.docker.internal ping:0.0.1-SNAPSHOT
#fi

# Multiple pongs
#docker run $detach --rm --name pong --env BROKER_HOST=host.docker.internal pong:0.0.1-SNAPSHOT

# Broker 2 (broker cluster)
#docker run $detach --rm -p 8003:8003 -p 7003:7003 --name broker2 --env BROKER_HOST=host.docker.internal --env SPRING_PROFILES_ACTIVE=broker2 broker:0.0.1-SNAPSHOT


###
# To demo without auth, go to frontend directly: http://localhost:9090
# To demo with auth (premium), go to authgateway and login as "user" or "premium" and password "pw": http://localhost:8080
