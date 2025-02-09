#!/bin/bash
# このスクリプトは、./images/original/ に存在する画像ファイルに対して、
# 対応するサムネイル画像が ./images/original/thumbnail/ に存在しない場合に、
# ImageMagick を利用してサムネイルを作成します。
#
# ※ すでに original と thumbnail に同名の画像がある場合は、その画像はスキップされます。

# original ディレクトリは固定
readonly ORIGINAL_DIR="./images/original/"

# サムネイル出力ディレクトリは固定（./images/original/thumbnail/）とする
readonly THUMBNAIL_DIR="./images/thumbnail/"

# THUMBNAIL_DIR が存在しない場合は作成
mkdir -p "$THUMBNAIL_DIR"

THUMBNAIL_SIZE="400x400"
# 圧縮品質（100 は劣化なし）
QUALITY=100

echo "Creating thumbnails for images in $ORIGINAL_DIR"
for file in "$ORIGINAL_DIR"*; do
    # ファイル以外（ディレクトリなど）はスキップ
    [ -f "$file" ] || continue

    basefile=$(basename "$file")
    thumbnail_file="${THUMBNAIL_DIR}${basefile}"

    # サムネイルファイルが既に存在すればスキップする
    if [ -f "$thumbnail_file" ]; then
        echo "Thumbnail already exists for $basefile, skipping."
        continue
    fi

    echo "Processing file: $file"
    # サムネイルを作成
    magick "$file" -resize "$THUMBNAIL_SIZE" -quality $QUALITY "$thumbnail_file"
    echo "Created thumbnail: $thumbnail_file"
done
echo "Thumbnail creation complete."