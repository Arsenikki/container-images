docker image inspect --format '{{json .}}' linuxserver/lazylibrarian:latest | 
  jq -r '.Config.Labels."org.opencontainers.image.version"'