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

In order to run this container as a non-root user,

```sh
docker run --name coredns --rm -p 1053:53 \
  --env NOMAD_ADDR=http://nomad:4646/ \
  --env NOMAD_TOKEN=XXXXXX \
  --env NOMAD_TTL=10 \
  ghcr.io/djthorpe/go-coredns-nomad:v1.11.1 
```

When you want to test it using dig,

```sh
dig +tcp -p 1053 @localhost service.default.nomad
```

