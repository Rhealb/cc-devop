{
  local config = import "global/config.jsonnet",
  "version.sh": |||
    #!/bin/bash
    CONSOLE_NS=%(console_ns)s
    gateway_ns=%(account_commit)s
    MYSQL_USERNAME=%(mysql_username)s
    MYSQL_PASSWORD=%(mysql_passowrd)s
  ||| % {
    console_ns: config.namespaces.console,
    gateway_ns: config.account.image_name,
    mysql_username: config.confidential.mysql.username,
    mysql_passowrd: config.confidential.mysql.password,
  },
}
