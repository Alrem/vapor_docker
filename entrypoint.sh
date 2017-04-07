#!/bin/bash
if [ -d vapor ]; then
  cd vapor
  ls -l
else
  echo 'Directory is not mount'
fi
