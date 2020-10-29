#!/bin/bash
FILES="./*"
for f in $FILES
do
  if [[ $f == *" "* ]]; then
	mv "$f" "${f//[[:space:]]}"
	echo "Processing $f file"
fi
done
