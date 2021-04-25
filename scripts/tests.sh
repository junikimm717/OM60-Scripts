#!/usr/bin/env bash

rm -rf data
./iterate.sh grep lorem
./iterate.sh awk '/lorem/'
./iterate.sh sed 's/lorem//g'
./iterate.sh cat DUMMY
./iterate.sh ls -al /
