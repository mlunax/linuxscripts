#!/bin/bash
git clone $1
dirname=$(echo -n $1 | awk -F "/" '{print $NF}' | sed "s/.git//")
cd $dirname
git push -o repo.private=false --mirror $2