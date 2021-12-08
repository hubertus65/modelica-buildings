#!/bin/bash
set -e # This will stop when diff returns non-zero

for i in {1..500}; do
  echo "******* i = $i"
  ../bin/runUnitTests.py -s Buildings.Examples.VAVReheat -b -d -n 1
  rm -rf ../tmp-Buildings*
  mv /tmp/tmp-Buildings* ..
done
