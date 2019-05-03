# debug-tools

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

  docker run --rm -ti \
    --pid="container:$1" \
    --net="container:$1" \
    --cap-add sys_admin \
    --cap-add sys_ptrace \
    hmarr/debug-tools
}
```
