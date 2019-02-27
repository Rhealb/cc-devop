components="cc-account cc-console cc-harbor cc-log cc-watch cc-metric cc-audit cc-gateway cc-initializer cc-notification cc-template cc-storage-listener cc-backend cc-gc cc-kubeorigin cc-storage cc-terminal dependency-checker cc-gitbook"
tag=$1
kubectl config use-context yc-context
for component in $components
do
if [ "$component" = "cc-gateway" ]
then
 kubectl set image deployment/gateway gateway=ihub.helium.io:29006/console/$component:$tag --namespace=system-tools
else
 kubectl set image deployment/$component $component=ihub.helium.io:29006/console/$component:$tag --namespace=cc-dev
fi
done
kubectl set image deployment/cc-console-http cc-console=ihub.helium.io:29006/console/cc-console:$tag --namespace=cc-dev
kubectl -ncc-dev patch deploy cc-console-http --type='json' -p='[{"op": "replace", "path":"/spec/template/spec/containers/0/env/0/value", "value":"'$tag'"}]'
