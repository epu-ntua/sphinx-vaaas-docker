#!/usr/bin/env bash

while ! curl -f vaaas:9392; do
  echo sleeping
  sleep 10
done
echo Connected!
