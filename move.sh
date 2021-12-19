#!/bin/bash

types=("episode" "application" "mini")

for type in "${types[@]}"; do
  rm -rf "./${type}"
  mkdir "./${type}"
  files="${type}*"
  export $type
  for file in $files; do
    t=$( echo $file | perl -pe 's|'$type'(.*)|sprintf("%02d-",${1}).'$type'|e' | tr -d '\n')
    dest="$type/$t"
    git mv $file $dest
  done
done
