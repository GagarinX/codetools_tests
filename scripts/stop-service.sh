#!/bin/bash
isExistApp="pgrep bottles"
if [[ -n $isExistApp ]]; then
  systemctl stop bottles.service
fi
