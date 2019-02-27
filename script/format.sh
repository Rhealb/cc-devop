files=$(find jsonnet -type f -name "*.jsonnet")
for file in $files
do
jsonnet fmt -i $file --string-style d
done
