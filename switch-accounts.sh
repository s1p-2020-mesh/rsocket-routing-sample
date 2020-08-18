#!/bin/bash

if [[ $1 == "cora" ]]; then

  sed -i '' 's/marygabry1508/ciberkleid/g' docker-push.sh

  pushd yaml/k8s
  sed -i '' 's/marygabry1508/ciberkleid/g' *.yml
  popd

  pushd yaml/istio
  sed -i '' 's/marygabry1508/ciberkleid/g' *.yml
  sed -i '' 's/marygabry\.name/springone\.coraiberkleid\.xyz/g' *.yml
  popd

else

  sed -i '' 's/ciberkleid/marygabry1508/g' docker-push.sh

  pushd yaml/eureka
  sed -i '' 's/ciberkleid/marygabry1508/g' *.yml
  popd

  pushd yaml/istio
  sed -i '' 's/ciberkleid/marygabry1508/g' *.yml
  sed -i '' 's/springone\.coraiberkleid\.xyz/marygabry\.name/g' *.yml
  popd

fi


