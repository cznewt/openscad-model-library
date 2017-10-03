#!/bin/bash

for file in $(find ../models/ -name *.scad); do
  echo "Rendering $(basename $file)..."
  openscad -o ../docs/source/img/$(basename $file | cut -d '.' -f 1).png --imgsize=1200,1200 --projection=o --render --colorscheme=DeepOcean $file
done
