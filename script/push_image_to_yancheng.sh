components="cc-account cc-console cc-harbor cc-log cc-watch cc-metric cc-audit cc-gateway cc-initializer cc-notification cc-template cc-storage-listener cc-backend cc-gc cc-kubeorigin cc-storage cc-terminal dependency-checker cc-gitbook"
yc_harbor="10.19.248.200:30100/console"
sh_harbor="10.19.140.200:29006/console"
tag=$1
yc_dump="docker save -o yc_console_$tag.tar "
docker login -u admin -p enncloud 10.19.140.200:29006
for component in $components
do
docker pull $sh_harbor/$component:stg
docker tag $sh_harbor/$component:stg $yc_harbor/$component:$tag
yc_dump="$yc_dump $yc_harbor/$component:$tag"
done

echo $yc_dump
$yc_dump
chmod +r yc_console_$tag.tar
gzip -1 yc_console_$tag.tar

scp yc_console_$tag.tar.gz yc:~/dropbox
ssh yc "gzip -d -f ~/dropbox/yc_console_"${tag}".tar.gz"
ssh yc "docker load -i ~/dropbox/yc_console_"${tag}".tar"
ssh yc 'docker login -u admin -p zhtsC1002 10.19.248.200:30100'
for component in $components
do
ssh yc "docker push "${yc_harbor}"/"${component}":"${tag}
done
ssh yc "rm ~/dropbox/yc_console_"${tag}".tar"
rm yc_console_$tag.tar.gz
