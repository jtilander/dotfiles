#!/bin/bash
#
# Converts all the .mts files into .mp4 files in the current directory
# Useful for importing SONY video files into Photos.
#

for f in *.MTS
do
	src=$f
	dst=$(basename "$f" .MTS).mp4

	ffmpeg -i "$src" -c:v copy -c:a copy -strict experimental "$dst"
done

exit 0
