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
    $ chevalierd <your settings>


### Notes

Running the Chevalier image without linking an elasticsearch container will result in a failure. See `chevalier/docker-entrypoint.sh`
