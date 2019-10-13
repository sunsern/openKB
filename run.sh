#!/bin/bash

docker run --detach \
    --add-host mongodb:$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+') \
    --name openkb \
    -v $PWD/config:/var/openKB/config \
    --env "VIRTUAL_HOST=kb.muzoo.io" \
    --env "VIRTUAL_PORT=4444" \
    --env "LETSENCRYPT_HOST=kb.muzoo.io" \
    --env "LETSENCRYPT_EMAIL=sunsern.che@mahidol.edu" \
    --restart=unless-stopped \
    openkb
