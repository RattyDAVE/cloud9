FROM alpine

RUN apk add --update --no-cache py3-bottle py3-requests g++ make tmux curl bash git nodejs \
 && git clone -b master --single-branch https://github.com/c9/core.git /root/.c9 && cd /root/.c9 \
 && mkdir -p ./node/bin ./bin ./node_modules \		
 && ln -sf "`which tmux`" ./bin/tmux \		
 && ln -s "`which node`" ./node/bin/node \		
 && ln -s "`which npm`" ./node/bin/npm \
 && npm i pty.js \
 && npm i sqlite3@3.1.8 sequelize@2.0.0-beta.0 \
 && npm i https://github.com/c9/nak/tarball/c9 \
 && echo 1 > ./installed \
 && NO_PULL=1 ./scripts/install-sdk.sh \
 && apk del g++ make \
 && git reset --hard && rm -rf /root/.c9/.git/objects/pack/* /var/cache/apk/* /tmp/* /var/tmp/* \
 && npm cache clean --force

RUN mkdir /workspace
VOLUME /workspace
WORKDIR /workspace

EXPOSE 8000

ENV USERNAME ""
ENV PASSWORD ""

ENTRYPOINT ["sh", "-c", "/usr/bin/node /root/.c9/server.js -l 0.0.0.0 -p 8000 -w /workspace -a $USERNAME:$PASSWORD"]
