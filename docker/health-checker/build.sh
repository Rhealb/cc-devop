docker build . -t health-cheker:1.0.0
docker tag health-cheker:1.0.0 10.19.140.200:29006/console/health-checker:1.0.0
docker push 10.19.140.200:29006/console/health-checker:1.0.0
