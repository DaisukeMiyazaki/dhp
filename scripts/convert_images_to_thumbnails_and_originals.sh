#!/bin/bash
# Run this script to convert the images under /images/pre_published/ to 
# images/thumbnails and move the pre_published images to /images/original

# Usage: ./scripts/convert_images_to_thumbnails_and_originals.sh ./images/pre_published/ ./images/thumbnail/
# this script requires imagemagick to be installed.
# https://imagemagick.org/

readonly IMAGE_DIR=${1}
echo "IMAGE_DIR: $IMAGE_DIR"

readonly THUMBNAIL_DIR=${2}
echo "THUMBNAIL_DIR: $THUMBNAIL_DIR"

THUMBNAIL_SIZE="200x200"

# compression quality
QUALITY=100


echo "Creating thumbnails for images in $IMAGE_DIR"
for file in "$IMAGE_DIR"*; do
    echo "Processing file: $file"
    extension="${file##*.}"
    echo "extension: $extension"

    # thumbnail file name is the same as the original file name
    thumbnail_file="${THUMBNAIL_DIR}${file##*/}"

    # generate thumbnail here
    magick "$file" -resize "$THUMBNAIL_SIZE" -quality $QUALITY "$thumbnail_file"

    echo "Created thumbnail: $thumbnail_file"
done
echo "Thumbnail creation complete."

echo "Moving images from $IMAGE_DIR to original directory"
for file in "$IMAGE_DIR"*; do
    echo "Moving file: $file"
    mv "$file" ./images/original/
done