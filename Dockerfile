FROM alpine:edge

RUN apk add py3-bottle py3-requests bash git nodejs && \
    apk add make gcc g++ python2 tmux nodejs npm && \
    git clone https://github.com/c9/core.git /root/.c9 && \
    cd /root/.c9
#    scripts/install-sdk.sh
    
RUN mkdir /workspace
VOLUME /workspace
WORKDIR /workspace

EXPOSE 8000

ENV USERNAME ""
ENV PASSWORD ""

ENTRYPOINT ["sh", "-c", "node /root/.c9/server.js -l 0.0.0.0 -p 8000 -w /workspace -a $USERNAME:$PASSWORD"]
