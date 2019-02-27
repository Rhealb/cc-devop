#!/bin/bash
DIR=$(dirname $0)
source ${DIR}/config.sh

# Floags
CEPH_FLAG=0
ACCOUNT_CON_FLAG=0
BACKEND_CON_FLAG=0
CONSOLE_CON_FLAG=0
TERMINAL_CON_FLAG=0
CONFIG_SERVER_FLAG=0
MYSQL_FLAG=0
REDIS_FLAG=0
RABBIT_FLAG=0
CONSOLE_FLAG=0
GATEWAY_FLAG=0
TERMINAL_FLAG=0
BACKEND_FLAG=0
ACCOUNT_FLAG=0

# Prepare
mkdir /root/.kube
cp /root/ceph.conf /etc/ceph/ceph.conf
cp /root/ceph.client.admin.keyring /etc/ceph/ceph.client.admin.keyring
cp /root/config /root/.kube/config

echo "checking ceph"
CEPH_STATUS=$(ceph -s | grep health | awk '{print $2}')
ceph -s
if [ $CEPH_STATUS != "HEALTH_OK" ]; then
  echo >&2 "ceph is in trouble with status ${CEPH_STATUS}"
  CEPH_FLAG=1
fi

echo "checking netwrok"
GATEWAY_POD=$(kubectl -n${GATEWAY_NS} get po | grep cc-gateway | awk '{print $1}')
kubectl -n${GATEWAY_NS} exec -it ${GATEWAY_POD} -- nslookup cc-account.${CONSOLE_NS} || {
  ACCOUNT_CON_FLAG=1
  echo >&2 "Can not resolve service cc-backend.${CONSOLE_NS}"
}
kubectl -n${GATEWAY_NS} exec -it ${GATEWAY_POD} -- nslookup cc-backend.${CONSOLE_NS} || {
  BACKEND_CON_FLAG=1
  echo >&2 "Can not resolve service cc-backend.${CONSOLE_NS}"
}
kubectl -n${GATEWAY_NS} exec -it ${GATEWAY_POD} -- nslookup cc-console.${CONSOLE_NS} || {
  CONSOLE_CON_FLAG=1
  echo >&2 "Can not resolve service cc-console.${CONSOLE_NS}"
}
kubectl -n${GATEWAY_NS} exec -it ${GATEWAY_POD} -- nslookup cc-terminal.${CONSOLE_NS} || {
  TERMINAL_CON_FLAG=1
  echo >&2 "Can not resolve service cc-terminal.${CONSOLE_NS}"
}

echo "checking monitor endpoints"
curl http://${PUBLIC_VIP}:${GATEWAY_NODE_PORT}/gw/wt/api/v1/health/console > o || {
  GATEWAY_FLAG=1
  echo "Can not query console's health endpoint"
}
cat o | json_pp
echo "checking config server"
CONFIG_SERVER_POD=$(kubectl -n${CONSOLE_NS} get po | grep cc-config-server | awk '{print $1}')
CONFIG_SERVER_READY=$(kubectl -n${CONSOLE_NS} get po | grep cc-config-server | awk '{print $2}')
if [ ${CONFIG_SERVER_READY} != "1/1" ]; then
  CONFIG_SERVER_FLAG=1
  echo "Config server current state"
  kubectl -n${CONSOLE_NS} get po | grep cc-config-server
  echo "Config server last state"
  kubectl -n${CONSOLE_NS} describe po ${CONFIG_SERVER_POD} | grep 'Last State' -A 4
  read -r -p "Restart config server?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${CONFIG_SERVER_POD}
      ;;
    *)
      echo "skipping config server"
      ;;
  esac
fi

echo "checking mysql"
MYSQL_POD=$(kubectl -n${CONSOLE_NS} get po | grep cc-mysql | awk '{print $1}')
MYSQL_READY=$(kubectl -n${CONSOLE_NS} get po | grep cc-mysql | awk '{print $2}')
if [ ${MYSQL_READY} != "1/1" ]; then
  MYSQL_FLAG=1
  echo "Mysql current state"
  kubectl -n${CONSOLE_NS} get po | grep cc-mysql
  echo "Mysql last state is"
  kubectl -n${CONSOLE_NS} describe po ${MYSQL_POD} | grep 'Last State' -A 4
  read -r -p "Restart mysql?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${MYSQL_POD}
      ;;
    *)
      echo "skipping mysql"
      ;;
  esac
fi

kubectl -n${CONSOLE_NS} exec -it ${MYSQL_POD} -- mysql -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} -e 'show databases;use mysql;' || {
  MYSQL_FLAG=1
  echo "MySQL query failed."
  read -r -p "Restart mysql?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${MYSQL_POD}
      ;;
    *)
      echo "skipping mysql"
      ;;
  esac
}

echo "checking redis"
REDIS_POD=$(kubectl -n${CONSOLE_NS} get po | grep cc-redis | awk '{print $1}')
REDIS_READY=$(kubectl -n${CONSOLE_NS} get po | grep cc-redis | awk '{print $2}')
if [ ${REDIS_READY} != "1/1" ]; then
  REDIS_FLAG=1
  echo "Redis current state"
  kubectl -n${CONSOLE_NS} get po | grep cc-redis
  echo "Redis last state is"
  kubectl -n${CONSOLE_NS} describe po ${RABBIT_POD} | grep 'Last State' -A 4
  read -r -p "Restart redis?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${RABBIT_POD}
      ;;
    *)
      echo "skipping redis"
      ;;
  esac
fi

echo "checking rabbitmq"
RABBIT_POD=$(kubectl -n${CONSOLE_NS} get po | grep cc-rabbitmq | awk '{print $1}')
RABBIT_READY=$(kubectl -n${CONSOLE_NS} get po | grep cc-rabbitmq | awk '{print $2}')
if [ ${RABBIT_READY} != "1/1" ]; then
  RABBIT_FLAG=1
  echo "Rabbitmq current state"
  kubectl -n${CONSOLE_NS} get po | grep cc-rabbitmq
  echo "Rabbitmq last state"
  kubectl -n${CONSOLE_NS} describe po ${RABBIT_POD} | grep 'Last State' -A 4
  read -r -p "Restart rabbitmq?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${GATEWAY_POD}
      ;;
    *)
      echo "skipping rabbitmq"
      ;;
  esac
fi

echo "checking gateway"
GATEWAY_POD=$(kubectl -n${GATEWAY_NS} get po | grep cc-gateway | awk '{print $1}')
GATEWAY_READY=$(kubectl -n${GATEWAY_NS} get po | grep cc-gateway | awk '{print $2}')
if [ ${GATEWAY_READY} != "1/1" ]; then
  GATEWAY_FLAG=1
  echo "Gateway current state"
  kubectl -n${GATEWAY_NS} get po | grep cc-gateway
  echo "Gateway last state"
  kubectl -n${GATEWAY_NS} describe po ${GATEWAY_POD} | grep 'Last State' -A 4
  read -r -p "Restart gateway?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${GATEWAY_NS} delete po ${GATEWAY_POD}
      ;;
    *)
      echo "skipping gateway"
      ;;
  esac
fi

echo "checking console"
CONSOLE_POD=$(kubectl -n${CONSOLE_NS} get po | grep cc-console | awk '{print $1}')
CONSOLE_READY=$(kubectl -n${CONSOLE_NS} get po | grep cc-console | awk '{print $2}')
if [ ${CONSOLE_READY} != "1/1" ]; then
  CONSOLE_FLAG=1
  echo "Console current state"
  kubectl -n${CONSOLE_NS} get po | grep cc-console
  echo "Console last state"
  kubectl -n${CONSOLE_NS} describe po ${CONSOLE_POD} | grep 'Last State' -A 4
  read -r -p "Restart console?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${CONSOLE_POD}
      ;;
    *)
      echo "skipping console"
      ;;
  esac
fi

echo "checking terminal"
TERMINAL_POD=$(kubectl -n${CONSOLE_NS} get po | grep cc-terminal | awk '{print $1}')
TERMINAL_READY=$(kubectl -n${CONSOLE_NS} get po | grep cc-terminal | awk '{print $2}')
if [ ${TERMINAL_READY} != "1/1" ]; then
  TERMINAL_FLAG=1
  echo "Terminal current state"
  kubectl -n${CONSOLE_NS} get po | grep cc-terminal
  echo "Terminal last state"
  kubectl -n${CONSOLE_NS} describe po ${TERMINAL_POD} | grep 'Last State' -A 4
  read -r -p "Restart terminal?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${TERMINAL_POD}
      ;;
    *)
      echo "skipping terminal"
      ;;
  esac
fi

echo "checking backend"
BACKEND_POD=$(kubectl -n${CONSOLE_NS} get po | grep cc-backend | awk '{print $1}')
BACKEND_READY=$(kubectl -n${CONSOLE_NS} get po | grep cc-backend | awk '{print $2}')
if [ ${BACKEND_READY} != "1/1" ]; then
  BACKEND_FLAG=1
  echo "Backend current state"
  kubectl -n${CONSOLE_NS} get po | grep cc-backend
  echo "Backend last state"
  kubectl -n${CONSOLE_NS} describe po ${BACKEND_POD} | grep 'Last State' -A 4
  read -r -p "Restart backend?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${BACKEND_POD}
      ;;
    *)
      echo "skipping backend"
      ;;
  esac
fi

echo "checking account"
ACCOUNT_POD=$(kubectl -n${CONSOLE_NS} get po | grep cc-account | awk '{print $1}')
ACCOUNT_READY=$(kubectl -n${CONSOLE_NS} get po | grep cc-account | awk '{print $2}')
if [ ${ACCOUNT_READY} != "1/1" ]; then
  ACCOUNT_FLAG=1
  echo "Account current state"
  kubectl -n${CONSOLE_NS} get po | grep cc-account
  echo "Account last state"
  kubectl -n${CONSOLE_NS} describe po ${ACCOUNT_POD} | grep 'Last State' -A 4
  read -r -p "Restart account?" response
  case "$response" in
    [yY][eE][sS]|[yY])
      kubectl -n${CONSOLE_NS} delete po ${ACCOUNT_POD}
      ;;
    *)
      echo "skipping account"
      ;;
  esac
fi

if [[ ${CEPH_FLAG} -eq 1 ]]; then
  echo -e "ceph\t\t\t\t\terror"
else
  echo -e "ceph\t\t\t\t\tok"
fi

if [[ ${ACCOUNT_CON_FLAG} -eq 0 ]]; then
  echo -e "service cc-account.${CONSOLE_NS} \t\tok"
else
  echo -e "service cc-account.${CONSOLE_NS} \t\terror"
fi

if [[ ${BACKEND_CON_FLAG} -eq 0 ]]; then
  echo -e "service cc-backend.${CONSOLE_NS} \t\tok"
else
  echo -e "service cc-backend.${CONSOLE_NS} \t\terror"
fi

if [[ ${CONSOLE_CON_FLAG} -eq 0 ]]; then
  echo -e "service cc-console.${CONSOLE_NS} \t\tok"
else
  echo -e "service cc-console.${CONSOLE_NS} \t\terror"
fi

if [[ ${TERMINAL_CON_FLAG} -eq 0 ]]; then
  echo -e "service cc-terminal.${CONSOLE_NS} \t\tok"
else
  echo -e "service cc-terminal.${CONSOLE_NS} \t\terror"
fi

if [[ ${ACCOUNT_FLAG} -eq 0 ]]; then
  echo -e "account\t\t\t\t\tok"
else
  echo -e "account\t\t\t\t\terror"
fi

if [[ ${BACKEND_FLAG} -eq 0 ]]; then
  echo -e "backend\t\t\t\t\tok"
else
  echo -e "backend\t\t\t\t\terror"
fi

if [[ ${CONFIG_SERVER_FLAG} -eq 0 ]]; then
  echo -e "config server\t\t\t\tok"
else
  echo -e "config server\t\t\t\terror"
fi

if [[ ${CONSOLE_FLAG} -eq 0 ]]; then
  echo -e "console\t\t\t\t\tok"
else
  echo -e "console\t\t\t\t\terror"
fi

if [[ ${GATEWAY_FLAG} -eq 0 ]]; then
  echo -e "gateway\t\t\t\t\tok"
else
  echo -e "gateway\t\t\t\t\terror"
fi

if [[ ${MYSQL_FLAG} -eq 0 ]]; then
  echo -e "mysql\t\t\t\t\tok"
else
  echo -e "mysql\t\t\t\t\terror"
fi

if [[ ${RABBIT_FLAG} -eq 0 ]]; then
  echo -e "rabbitmq\t\t\t\tok"
else
  echo -e "rabbitmq\t\t\t\terror"
fi

if [[ ${REDIS_FLAG} -eq 0 ]]; then
  echo -e "redis\t\t\t\t\tok"
else
  echo -e "redis\t\t\t\t\terror"
fi

if [[ ${TERMINAL_FLAG} -eq 0 ]]; then
  echo -e "terminal\t\t\t\tok"
else
  echo -e "terminal\t\t\t\terror"
fi
