#!/bin/bash

trap 'exit 2' SIGINT SIGTERM

while [ true ]; do
  date
  sleep 5
done
