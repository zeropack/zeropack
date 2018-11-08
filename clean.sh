#!/bin/bash
echo "Start: Clean Node Modules ...."
rm -rf ./packages/*/node_modules
rm -rf ./examples/*/node_modules
rm -rf ./node_modules
echo "Finish: Clean Node Modules."
echo "Start: Clean Cache"
rm -rf ./packages/*/.cache
rm -rf ./packages/*/.cache-loader
rm -rf ./examples/*/.cache
rm -rf ./examples/*/.cache-loader
echo "Finish: Clean Cache"