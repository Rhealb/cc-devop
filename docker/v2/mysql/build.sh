docker build . -t mysql:5.7.1 --no-cache
docker tag mysql:5.7.1 10.19.140.200:29006/console/mysql-binlog-utf8:5.7.1
docker tag mysql:5.7.1 10.19.140.200:29006/release/mysql-binlog-utf8:5.7.1
docker push 10.19.140.200:29006/console/mysql-binlog-utf8:5.7.1
docker push 10.19.140.200:29006/release/mysql-binlog-utf8:5.7.1
