docker build . -t s3cmd:1.0.0
docker tag s3cmd:1.0.0 10.19.140.200:29006/console/s3cmd:1.0.0
docker push 10.19.140.200:29006/console/s3cmd:1.0.0
