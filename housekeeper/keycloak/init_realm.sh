export PATH=$PATH:/opt/jboss/keycloak/bin
kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user ${KEYCLOAK_USER} --password ${KEYCLOAK_PASSWORD}
kcadm.sh create realms -f /opt/jboss/kc/kc-realm.json
kcadm.sh create user-storage/7010891d-54e7-49f1-b589-86883be16b5f/sync?action=triggerFullSync -r console-sso

kcadm.sh create clients -r console-sso -f /opt/jboss/kc/kc-client-console.json
kcadm.sh create clients -r console-sso -f /opt/jboss/kc/kc-client-lmd.json
kcadm.sh create clients -r console-sso -f /opt/jboss/kc/kc-client-ennctl.json
kcadm.sh create clients -r console-sso -f /opt/jboss/kc/kc-client-scale.json
