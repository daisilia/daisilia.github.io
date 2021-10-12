#!/bin/bash

if [[ $# -gt 0 ]]; then
    mes="`date +%Y.%m.%d` $1"
else
    mes="`date +%Y.%m.%d`"
fi

git add .
git commit -m "${mes}"
git push
