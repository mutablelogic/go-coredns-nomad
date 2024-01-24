ARG PLATFORM
ARG ARCH
ARG VERSION
FROM --platform=${PLATFORM}/${ARCH} golang:1.21-bullseye AS builder

# Run makefile to build all the commands
WORKDIR /usr/src/app
COPY . .
RUN apt -y update
RUN git clone https://github.com/coredns/coredns && cd coredns && git checkout ${VERSION} && make

# Copy server to /usr/local/bin
FROM --platform=${PLATFORM}/${ARCH} debian:bullseye-slim
RUN apt -y update
COPY --from=builder /usr/src/app/coredns /usr/local/bin/
COPY etc/docker/server-entrypoint.sh .
COPY Corefile .

# Labels
LABEL org.opencontainers.image.source=https://github.com/mutablelogic/go-coredns-nomad

# Entrypoint when running the server
ENTRYPOINT [ "/server-entrypoint.sh" ]
CMD [ "/usr/local/bin/coredns", "-conf", "/Corefile" ]
