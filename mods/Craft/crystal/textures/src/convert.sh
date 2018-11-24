#!/bin/bash

if [[ "$#" == "1" ]]; then
	convert $1 -alpha set -channel A -evaluate set 60% ../$1
else
	echo $0 image.png
fi
