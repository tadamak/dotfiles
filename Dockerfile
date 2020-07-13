FROM alpine:latest

ENV PACKAGES="curl wget sudo" \
    TERM=xterm-256-color

RUN apk update \
 && apk add --no-cache $PACKAGES

WORKDIR /root

COPY . /root/dotfiles

RUN cd /root/dotfiles \
 && ./install.sh

CMD ["zsh", "-l"]
