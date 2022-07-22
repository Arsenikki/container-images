ARG BASE_IMAGE

FROM $BASE_IMAGE as final

# disable interactive prompt during build
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  calibre