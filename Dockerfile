FROM ubuntu:18.04

ENV PACKAGES="curl wget sudo git zsh jq tmux ca-certificates"

WORKDIR /root

RUN apt-get -y update \
 && apt-get install -yq --no-install-recommends $PACKAGES \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && truncate -s 0 /var/log/*log

COPY . /root/dotfiles

RUN zsh <dotfiles/install.zsh \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["zsh", "-l"]
