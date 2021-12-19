FROM alpine:latest

RUN apk add --no-cache py-pip ca-certificates \
  && pip install s3cmd

WORKDIR /s3

CMD ["sh"]