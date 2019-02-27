#!/bin/bash
SRC=docker/src
BRANCH=$1
cd $SRC
for item in $(ls)
do
  cd $item && git fetch && git checkout ${BRANCH} &&  git pull && cd ..
done

cd ../..
