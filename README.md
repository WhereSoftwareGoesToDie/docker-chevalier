# docker-chevalier
Docker build scripts for chevalier

### Sample Docker invocation

    cd elasticsearch
    docker build -t anchor/es .
    cd ../chevalier
    docker build -t anchor/chevalier .
    cd ..

    docker run -d --name es        --net=host -p 9200:9200 -p 9300:9300 -t anchor/es
    docker run -d --name chevalier --net=host -p 6283:6283 -p 6284:6284 -v <configfile>:/etc/chevalier.gcfg -t anchor/chevalier

    # then, invoke anchor/docker-sieste
    docker run    --name sieste    --net=host -p 8000:8000                 anchor/sieste /bin/bash
    $ CHEVALIER_URL=tcp://localhost:6283 BROKER=chateau_xx.local sieste
