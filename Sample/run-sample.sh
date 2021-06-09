#!/bin/bash

cd $(dirname $_) && curl -o output/kitten.jpg https://placekitten.com/5000/5000 && swift run && cd -