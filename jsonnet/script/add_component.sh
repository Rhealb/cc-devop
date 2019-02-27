dest=$1
base="account"
mkdir -p $dest/list
cp ${base}/${base}-deploy.jsonnet  ${dest}/${dest}-deploy.jsonnet
cp ${base}/${base}-svc.jsonnet  ${dest}/${dest}-svc.jsonnet
cp ${base}/list/${base}-list.jsonnet ${dest}/list/${dest}-list.jsonnet
