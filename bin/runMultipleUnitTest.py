#!/bin/bash
set -e # This will stop when diff returns non-zero

for i in {1..100}; do
  echo "******* i = $i"
  ../bin/runUnitTests.py -s Buildings.ThermalZones.EnergyPlus.Examples -b -d -n 1
done
