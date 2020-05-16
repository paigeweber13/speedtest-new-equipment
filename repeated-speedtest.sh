#!/bin/bash

# uses cli for speedtest.net, available here:
# https://www.speedtest.net/apps/cli

# to see list of servers, run "speedtest -L". These are at or close to
# Charlotte, NC
SERVERS="4211 5028 12784"
NUM_TRIALS=4

# first test will use automatically chosen "best server"
speedtest --output-header -f csv

# repeated trials
for i in $(seq $NUM_TRIALS); do
  for server in $SERVERS; do
    # sleep a random, short amount of time
    sleep $((3 + RANDOM % 17))
    # run the test
    speedtest -s $server -f csv

    # debug
    # echo "trial number $i"
    # echo "speedtest -s $server -f csv"
  done
done
