# docker-chevalier
Docker build scripts for chevalier



### Sample Docker invocation

    cd elasticsearch
    docker build -t anchor/es .
    cd ../chevalier
    docker build -t anchor/chevalier .
    cd ..

    docker run -d --name es -P -t anchor/es
    docker run -P --rm -i -t --name chevalier --link es:es anchor/chevalier /bin/bash


