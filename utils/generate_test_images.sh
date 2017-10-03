#!/bin/bash

for file in $(find ../tests/ -name *.scad); do
  openscad -o ../docs/source/img/$(basename $file | cut -d '.' -f 1).png $file
done
