# debug-tools

A Docker image with several useful debugging tools. Check the Dockerfile to see
which packages are installed.

## Usage

Published to [Docker Hub](https://hub.docker.com/r/hmarr/debug-tools) as
`hmarr/debug-tools`.

The following shell function runs this image in the same pid and network
namespaces as another container (specified as the first argument). It also has
the permissions required to run strace.

```bash
docker-debug() {
  if [ -z "$1" ]; then
    echo "usage: docker-debug CONTAINER-ID"
    return 1
  fi

  echo "Starting debug sidecar for container $1"

  [ ! -d "/tmp/debug-$1" ] && mkdir "/tmp/debug-$1"
  echo "Mounting /scratch to /tmp/debug-$1"

  docker run --rm -ti \
    --name="debug-${1:0:6}" \
    --workdir="/scratch" \
    --volume="/tmp/debug-$1:/scratch" \
    --pid="container:$1" \
    --network="container:$1" \
    --cap-add sys_admin \
    --cap-add sys_ptrace \
    hmarr/debug-tools
}
```
