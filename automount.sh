#!/bin/bash

echo $AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY > /s3fs_credentials/s3fs.cred 
chmod 600 /s3fs_credentials/s3fs.cred

# mount s3 bucket
s3fs $S3_BUCKET $MNT_POINT -o passwd_file=/s3fs_credentials/s3fs.cred -o url="https://s3-$AWS_DEFAULT_REGION.amazonaws.com" -o allow_root -f

