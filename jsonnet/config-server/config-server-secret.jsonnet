(import "common/secret.jsonnet") + {
  // config variables
  _config:: {},
  // override super global variables
  _meta_name:: $._config.config_server.secret.name,
  _meta_namespace:: $._config.namespaces.console,
  _data:: {
    "encrypt-key": "a1RuUUJkY1JmNExkUUJjOUJJdklQeGJGWkxCSkk2WDNO",
    "security-password": "MFlVUk9SR0Y2UkRsUlNWUjZiMVlyTUU5elIwRTlQUT09",
  },
}
