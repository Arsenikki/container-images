ARG BASE_IMAGE

FROM alpine:latest as builder

WORKDIR /app/vuetorrent
RUN apk add --no-cache wget curl libarchive-tools

RUN curl -s https://api.github.com/repos/WDaan/VueTorrent/releases/latest \
  | grep browser_download_url \
  | cut -d '"' -f 4 \
  | wget -i- -O- \
  | bsdtar -xvf- 

FROM $BASE_IMAGE as final
COPY --from=builder /app/vuetorrent/ /app/
USER kah