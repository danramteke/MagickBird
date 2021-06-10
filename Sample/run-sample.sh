#!/bin/bash

cd $(dirname $_) && \
    mkdir -p output/png && \
    mkdir -p output/png8 && \
    mkdir -p output/jpg && \
    curl -o output/india.png https://upload.wikimedia.org/wikipedia/commons/7/77/Legality_of_cannabis_in_India.png && \
    swift run && \
    cd -