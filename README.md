# go-coredns-nomad

coredns with nomad plugin for service discovery. This repository will build a docker container 
with coredns and the nomad plugin.

## Using the container

In order to run this container, and have service discovery
work on port 1053, you need to pass in the following environment variables:

  * `NOMAD_ADDR` - the address of the nomad server
  * `NOMAD_TOKEN` - the token to use to query the nomad server
  * `NOMAD_TTL` - the TTL for the DNS records, in seconds

For example:

```sh
docker run --name coredns-nomad --rm -p 1053:53 \
  --env NOMAD_ADDR=http://nomad:4646/ \
  --env NOMAD_TOKEN=XXXXXX \
  --env NOMAD_TTL=10 \
  ghcr.io/mutablelogic/coredns-nomad:v1.11.1
```

When you want to test it using dig, query `<service>.<namespace>.nomad`. For example,

```sh
dig +tcp -p 1053 @localhost service.default.nomad
```

## Building the container

You can use the pre-built container from the GitHub Container Registry (for arm64 or amd64 on Linux),
or you can build it yourself.

```sh
git clone git@github.com:mutablelogic/go-coredns-nomad.git
cd go-coredns-nomad
docker build \
  --tag ${REGISTRY}/${USERNAME}/coredns-nomad:v1.11.1 \
  --build-arg ARCH=$(arch) \
  --build-arg PLATFORM=$(uname -s | tr '[:upper:]' '[:lower:]') \
  --build-arg VERSION=v1.11.1 \
  -f etc/docker/Dockerfile .  
```
