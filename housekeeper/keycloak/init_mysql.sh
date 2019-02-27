mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "create database keycloak character set utf8 collate utf8_unicode_ci;" || {
  echo "Failed to create keycloak database"
  exit 1
}
mysql -uroot -p${MYSQL_ROOT_PASSWORD} keycloak < /keycloak.sql || {
  echo "Failed to init keycloak database"
  exit 1
}
