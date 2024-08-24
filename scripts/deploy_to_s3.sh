# /bin/bash
# Run this script to deploy images and index.html to S3 bucket.

# The below is the list of files and directories that will be deployed to the S3 bucket.
# images/thumbnail/
# images/original/
# index.html

# The script takes an argument that represents the S3 bucket endpoint.
# usage: ./deploy_to_s3.sh <S3_BUCKET_ENDPOINT>

readonly ENDPOINT=${1}

# deploy images
aws s3 cp images/thumbnail/ s3://$ENDPOINT/images/thumbnail --recursive
aws s3 cp images/original/ s3://$ENDPOINT/images/original --recursive

# deploy folder index.html
aws s3 cp images/thumbnail/index.html s3://$ENDPOINT/images/thumbnail/index.html
aws s3 cp images/original/index.html s3://$ENDPOINT/images/original/index.html

# deploy main index.html
aws s3 cp images/index.html s3://$ENDPOINT/images/index.html

# deploy index.html
aws s3 cp index.html s3://$ENDPOINT/index.html

# deploy js
aws s3 cp enlargeImageOnClick.js s3://$ENDPOINT/enlargeImageOnClick.js

echo "Deployment completed."