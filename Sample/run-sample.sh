#!/bin/bash

cd $(dirname $_) && \
    mkdir -p output/png && \
    mkdir -p output/jpg && \
    curl -o output/kitten.jpg https://placekitten.com/5000/5000 && \
    swift run && cd -