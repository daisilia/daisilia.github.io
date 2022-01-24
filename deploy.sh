#!/bin/bash

if [[ $# -gt 0 ]]; then
    mes="`date +%Y-%m-%dT%T%:z` $1"
else
    mes="`date +%Y-%m-%dT%T%:z`"
fi

R/build.R
git add .
git commit -m "${mes}"
git push
