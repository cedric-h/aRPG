#!/bin/sh

rm -rf build

mkdir build

cd build

../sokol/shdc/linux/sokol-shdc --input ../shaders.glsl --output shaders.glsl.h --slang glsl330

gcc ../main.c -o aRPG -DSOKOL_GLCORE33 -pthread -I../../sokol -I../libs -lGL -ldl -lm -lX11 -lasound -lXi -lXcursor