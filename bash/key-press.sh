#!/bin/bash

while true; do
  read -s -n 1 -t 0.1 key
  if [[ -n "$key" ]]; then
    echo "Key pressed: $key"
    # Perform actions based on the key
    if [[ "$key" == "q" ]]; then
        echo "Exiting..."
        break
    fi
  else
    # Perform other tasks when no key is pressed
    echo "Doing other stuff..."
  fi
done
