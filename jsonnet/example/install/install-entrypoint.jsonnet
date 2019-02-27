{
  local basic = import "example/install/install-basic.jsonnet",
  local basic_component = import "example/install/install-basic-component.jsonnet",
  local console_basic = import "example/install/install-console-basic.jsonnet",
  local console_pro = import "example/install/install-console-pro.jsonnet",
  local keycloak = import "example/install/install-keycloak.jsonnet",
  "basic-specicifation.json": basic,
  "basic-component-specification.json": basic_component,
  "console-basic-specicifation.json": console_basic,
  "console-pro-specicifation.json": console_pro,
  "keycloak-spec.json": keycloak,
}
