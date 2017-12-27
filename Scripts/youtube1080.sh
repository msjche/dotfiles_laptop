# YouTube 1080p Video Downloader

# Sets up a variable to track where we were at the start of all this
ORIGINAL_DIR=$(echo $PWD)
ORIGINAL_DIR+="/"

# Sets up temporary directory for the conversion process.
TEMPDIR=$(mktemp -d)

# Go to the temporary directory. It will be our "scratchspace" so we don't accidentally mess with other files
cd $TEMPDIR

echo -e "INVOKED WITH:\n\t$0 $1 $2 $3 $4 $5 $6"
echo "Tempdir: $TEMPDIR"
echo "Original dir: $ORIGINAL_DIR"

# Downloads the video and audio for the video in separate streams
youtube-dl -f 140 "$1" # Downloads audio
youtube-dl -f 137 "$1" # Downloads video


# String flogging for simple rename
x=$(basename *.mp4) # Only way I know of to get x to equal "*.mp4"
NEW_FILENAME="${x%-*}" # Extracts everything prior to the '-' character (the name of the video, without the YT ID or file extension)
NEW_FILENAME+="-1080p.mp4"

ffmpeg -i *.mp4 -i *.m4a -map 0 -map 1 -acodec copy -vcodec copy -shortest "$NEW_FILENAME" # Combines files into 1080 video with sound

# Move the newly created video back to our original directory, then move there
mv "$NEW_FILENAME" $ORIGINAL_DIR
cd $ORIGINAL_DIR 

# Delete our temporary directory with it's working files
rm -rf "$TEMPDIR"
