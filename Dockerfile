FROM golang:buster 
RUN apt-get update -y && apt-get install -qq -y git glusterfs-server

ENV GOPATH $HOME/go
RUN go get github.com/trajano/docker-volume-plugins/glusterfs-volume-plugin \
  && mv $GOPATH/bin/glusterfs-volume-plugin / \ 
  && rm -rf $GOPATH \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*
