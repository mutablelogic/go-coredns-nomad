# go-coredns-nomad

coredns with nomad plugin for service discovery

Currently in progress, but this is how you build the container.

```sh
docker build \
  --tag ghcr.io/djthorpe/go-coredns-nomad:v1.11.1 \
  --build-arg ARCH=$(arch) \
  --build-arg PLATFORM=$(uname -s | tr '[:upper:]' '[:lower:]') \
  --build-arg VERSION=v1.11.1 \
  -f etc/docker/Dockerfile .  
```
