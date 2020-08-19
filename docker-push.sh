#!/bin/bash

registry=ciberkleid

declare -a apps=("ping:0.0.1-SNAPSHOT"
                "pong:0.0.1-SNAPSHOT"
                "broker:0.0.1-SNAPSHOT"
                )

for app in "${apps[@]}"
do
  docker tag $app $registry/s1p-2020-mesh-rs-$app
  docker push $registry/s1p-2020-mesh-rs-$app
done
