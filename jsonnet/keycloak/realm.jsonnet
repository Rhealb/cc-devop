{
  // config variables
  _global_config:: {},
  id: $._global_config.keycloak_config.realm,
  realm: $._global_config.keycloak_config.realm,
  notBefore: 0,
  revokeRefreshToken: false,
  refreshTokenMaxReuse: 0,
  accessTokenLifespan: 300,
  accessTokenLifespanForImplicitFlow: 900,
  ssoSessionIdleTimeout: 1800,
  ssoSessionMaxLifespan: 36000,
  offlineSessionIdleTimeout: 2592000,
  offlineSessionMaxLifespanEnabled: false,
  offlineSessionMaxLifespan: 5184000,
  accessCodeLifespan: 60,
  accessCodeLifespanUserAction: 300,
  accessCodeLifespanLogin: 1800,
  actionTokenGeneratedByAdminLifespan: 43200,
  actionTokenGeneratedByUserLifespan: 300,
  enabled: true,
  sslRequired: "external",
  registrationAllowed: false,
  registrationEmailAsUsername: false,
  rememberMe: false,
  verifyEmail: false,
  loginWithEmailAllowed: false,
  duplicateEmailsAllowed: true,
  resetPasswordAllowed: false,
  editUsernameAllowed: false,
  bruteForceProtected: false,
  permanentLockout: false,
  maxFailureWaitSeconds: 900,
  minimumQuickLoginWaitSeconds: 60,
  waitIncrementSeconds: 60,
  quickLoginCheckMilliSeconds: 1000,
  maxDeltaTimeSeconds: 43200,
  failureFactor: 30,
  defaultRoles: [
    "offline_access",
    "uma_authorization",
  ],
  requiredCredentials: [
    "password",
  ],
  otpPolicyType: "totp",
  otpPolicyAlgorithm: "HmacSHA1",
  otpPolicyInitialCounter: 0,
  otpPolicyDigits: 6,
  otpPolicyLookAheadWindow: 1,
  otpPolicyPeriod: 30,
  otpSupportedApplications: [
    "FreeOTP",
    "Google Authenticator",
  ],
  scopeMappings: [
    {
      clientScope: "offline_access",
      roles: [
        "offline_access",
      ],
    },
  ],
  clientScopes: [
    {
      id: "36c75fa7-71cb-487c-8277-2b79505d1b93",
      name: "address",
      description: "OpenID Connect built-in scope: address",
      protocol: "openid-connect",
      attributes: {
        "consent.screen.text": "${addressScopeConsentText}",
        "display.on.consent.screen": "true",
      },
      protocolMappers: [
        {
          id: "641897f0-54ba-4c67-9931-35de84da79d4",
          name: "address",
          protocol: "openid-connect",
          protocolMapper: "oidc-address-mapper",
          consentRequired: false,
          config: {
            "user.attribute.formatted": "formatted",
            "user.attribute.country": "country",
            "user.attribute.postal_code": "postal_code",
            "userinfo.token.claim": "true",
            "user.attribute.street": "street",
            "id.token.claim": "true",
            "user.attribute.region": "region",
            "access.token.claim": "true",
            "user.attribute.locality": "locality",
          },
        },
      ],
    },
    {
      id: "4da08467-d90b-4192-8a42-c5f450537747",
      name: "phone",
      description: "OpenID Connect built-in scope: phone",
      protocol: "openid-connect",
      attributes: {
        "consent.screen.text": "${phoneScopeConsentText}",
        "display.on.consent.screen": "true",
      },
      protocolMappers: [
        {
          id: "376c9f0e-3f1e-400f-895c-d9780677fff9",
          name: "phone number verified",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "phoneNumberVerified",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "phone_number_verified",
            "jsonType.label": "boolean",
          },
        },
        {
          id: "e1f30652-f304-44ae-9e36-e11c2e5e6c0b",
          name: "phone number",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "phoneNumber",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "phone_number",
            "jsonType.label": "String",
          },
        },
      ],
    },
    {
      id: "794e2bf1-e65d-4342-b3f9-03907ddd7503",
      name: "role_list",
      description: "SAML role list",
      protocol: "saml",
      attributes: {
        "consent.screen.text": "${samlRoleListScopeConsentText}",
        "display.on.consent.screen": "true",
      },
      protocolMappers: [
        {
          id: "4d04937a-8071-4d5c-9e49-af2bb4a15b8f",
          name: "role list",
          protocol: "saml",
          protocolMapper: "saml-role-list-mapper",
          consentRequired: false,
          config: {
            single: "false",
            "attribute.nameformat": "Basic",
            "attribute.name": "Role",
          },
        },
      ],
    },
    {
      id: "9abe2473-785f-408c-9487-409b991a0f4b",
      name: "email",
      description: "OpenID Connect built-in scope: email",
      protocol: "openid-connect",
      attributes: {
        "consent.screen.text": "${emailScopeConsentText}",
        "display.on.consent.screen": "true",
      },
      protocolMappers: [
        {
          id: "eff2dffc-7859-426a-8281-cddc8dbb93b4",
          name: "email",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-property-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "email",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email",
            "jsonType.label": "String",
          },
        },
        {
          id: "f1410d51-f309-4a42-9a79-c140a4428fc9",
          name: "email verified",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-property-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "emailVerified",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "email_verified",
            "jsonType.label": "boolean",
          },
        },
      ],
    },
    {
      id: "ce062f36-85b8-4424-a32d-7cf7f06a610d",
      name: "offline_access",
      description: "OpenID Connect built-in scope: offline_access",
      protocol: "openid-connect",
      attributes: {
        "consent.screen.text": "${offlineAccessScopeConsentText}",
        "display.on.consent.screen": "true",
      },
    },
    {
      id: "f4e7ff8a-0cd4-40d8-b785-99df9cfde653",
      name: "profile",
      description: "OpenID Connect built-in scope: profile",
      protocol: "openid-connect",
      attributes: {
        "consent.screen.text": "${profileScopeConsentText}",
        "display.on.consent.screen": "true",
      },
      protocolMappers: [
        {
          id: "5c3a02da-03e2-4543-a4f0-94419f5e21b6",
          name: "middle name",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "middleName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "middle_name",
            "jsonType.label": "String",
          },
        },
        {
          id: "b0887fa7-93fd-483a-bcbb-ba873a48ec2b",
          name: "nickname",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "nickname",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "nickname",
            "jsonType.label": "String",
          },
        },
        {
          id: "1f8f13a7-c4e6-42b8-8db3-8bbd2c672b0f",
          name: "picture",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "picture",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "picture",
            "jsonType.label": "String",
          },
        },
        {
          id: "52506b55-2ccf-4493-82ce-d728e504d527",
          name: "given name",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-property-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "firstName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "given_name",
            "jsonType.label": "String",
          },
        },
        {
          id: "4814ca5b-eb97-40b5-9a0e-860189d1bf31",
          name: "locale",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "locale",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "locale",
            "jsonType.label": "String",
          },
        },
        {
          id: "fadf10d1-d2ed-41cd-93a0-7ef99ec1fee7",
          name: "website",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "website",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "website",
            "jsonType.label": "String",
          },
        },
        {
          id: "14267896-ce91-4771-91c6-f7ebd1dfd0cc",
          name: "gender",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "gender",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "gender",
            "jsonType.label": "String",
          },
        },
        {
          id: "b27ba2e6-239d-4520-9707-2c00e6c09c0d",
          name: "profile",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "profile",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "profile",
            "jsonType.label": "String",
          },
        },
        {
          id: "34fbe0a6-6939-4bf9-9e66-d05c8bdb61d6",
          name: "username",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-property-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "username",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "preferred_username",
            "jsonType.label": "String",
          },
        },
        {
          id: "d4ab04e0-0a71-46de-9d2c-cfd5c2edf7d6",
          name: "updated at",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "updatedAt",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "updated_at",
            "jsonType.label": "String",
          },
        },
        {
          id: "6ea3a213-4616-49ea-83a3-210a48d061bc",
          name: "birthdate",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "birthdate",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "birthdate",
            "jsonType.label": "String",
          },
        },
        {
          id: "fc77da61-5764-4858-9ad4-c252c4b21b3e",
          name: "zoneinfo",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-attribute-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "zoneinfo",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "zoneinfo",
            "jsonType.label": "String",
          },
        },
        {
          id: "4416eed8-7c2f-4b2a-bd0f-d358050659f7",
          name: "full name",
          protocol: "openid-connect",
          protocolMapper: "oidc-full-name-mapper",
          consentRequired: false,
          config: {
            "id.token.claim": "true",
            "access.token.claim": "true",
            "userinfo.token.claim": "true",
          },
        },
        {
          id: "826e0b6f-af45-426c-97c0-79a1c5f35daa",
          name: "family name",
          protocol: "openid-connect",
          protocolMapper: "oidc-usermodel-property-mapper",
          consentRequired: false,
          config: {
            "userinfo.token.claim": "true",
            "user.attribute": "lastName",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "family_name",
            "jsonType.label": "String",
          },
        },
      ],
    },
  ],
  defaultDefaultClientScopes: [
    "role_list",
    "email",
    "profile",
  ],
  defaultOptionalClientScopes: [
    "address",
    "phone",
    "offline_access",
  ],
  browserSecurityHeaders: {
    xContentTypeOptions: "nosniff",
    xRobotsTag: "none",
    xFrameOptions: "SAMEORIGIN",
    xXSSProtection: "1; mode=block",
    contentSecurityPolicy: "frame-src 'self'; frame-ancestors 'self'; object-src 'none';",
    strictTransportSecurity: "max-age=31536000; includeSubDomains",
  },
  smtpServer: {},
  loginTheme: "console-login",
  eventsEnabled: true,
  eventsListeners: [
    "jboss-logging",
  ],
  enabledEventTypes: [
    "LOGIN",
  ],
  adminEventsEnabled: false,
  adminEventsDetailsEnabled: false,
  components: {
    "org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy": [
      {
        id: "02c620e4-7981-418d-b52d-159480ae2310",
        name: "Full Scope Disabled",
        providerId: "scope",
        subType: "anonymous",
        subComponents: {},
        config: {},
      },
      {
        id: "17540b16-3e9d-4676-9743-a1742e3db59c",
        name: "Allowed Client Scopes",
        providerId: "allowed-client-templates",
        subType: "authenticated",
        subComponents: {},
        config: {
          "allow-default-scopes": [
            "true",
          ],
        },
      },
      {
        id: "9e225c45-6115-47c7-90b8-bfd049be737e",
        name: "Allowed Protocol Mapper Types",
        providerId: "allowed-protocol-mappers",
        subType: "anonymous",
        subComponents: {},
        config: {
          "allowed-protocol-mapper-types": [
            "oidc-usermodel-attribute-mapper",
            "saml-user-attribute-mapper",
            "oidc-address-mapper",
            "oidc-usermodel-property-mapper",
            "oidc-full-name-mapper",
            "oidc-sha256-pairwise-sub-mapper",
            "saml-role-list-mapper",
            "saml-user-property-mapper",
          ],
        },
      },
      {
        id: "01b89489-1fb6-4d62-a7d0-32d63c909737",
        name: "Consent Required",
        providerId: "consent-required",
        subType: "anonymous",
        subComponents: {},
        config: {},
      },
      {
        id: "d21292e9-831d-4e5c-9a97-9ff8e84ee8f1",
        name: "Max Clients Limit",
        providerId: "max-clients",
        subType: "anonymous",
        subComponents: {},
        config: {
          "max-clients": [
            "200",
          ],
        },
      },
      {
        id: "e6008b97-7051-49cc-8e62-2595187de3b2",
        name: "Trusted Hosts",
        providerId: "trusted-hosts",
        subType: "anonymous",
        subComponents: {},
        config: {
          "host-sending-registration-request-must-match": [
            "true",
          ],
          "client-uris-must-match": [
            "true",
          ],
        },
      },
      {
        id: "e71f6095-0ecf-4e00-bb0e-e9462f4ac4ab",
        name: "Allowed Client Scopes",
        providerId: "allowed-client-templates",
        subType: "anonymous",
        subComponents: {},
        config: {
          "allow-default-scopes": [
            "true",
          ],
        },
      },
      {
        id: "84931662-14ef-4b0e-8d5a-17d815e211a0",
        name: "Allowed Protocol Mapper Types",
        providerId: "allowed-protocol-mappers",
        subType: "authenticated",
        subComponents: {},
        config: {
          "allowed-protocol-mapper-types": [
            "oidc-usermodel-property-mapper",
            "saml-user-property-mapper",
            "saml-user-attribute-mapper",
            "oidc-address-mapper",
            "oidc-full-name-mapper",
            "oidc-usermodel-attribute-mapper",
            "oidc-sha256-pairwise-sub-mapper",
            "saml-role-list-mapper",
          ],
        },
      },
    ],
    "org.keycloak.storage.UserStorageProvider": [
      {
        id: "7010891d-54e7-49f1-b589-86883be16b5f",
        name: "ldap-sync",
        providerId: "ldap",
        subComponents: {
          "org.keycloak.storage.ldap.mappers.LDAPStorageMapper": [
            {
              id: "142ee818-faf2-40cc-95b6-02f5e305710e",
              name: "creation date",
              providerId: "user-attribute-ldap-mapper",
              subComponents: {},
              config: {
                "ldap.attribute": [
                  "createTimestamp",
                ],
                "is.mandatory.in.ldap": [
                  "false",
                ],
                "read.only": [
                  "true",
                ],
                "always.read.value.from.ldap": [
                  "true",
                ],
                "user.model.attribute": [
                  "createTimestamp",
                ],
              },
            },
            {
              id: "acad40fd-a2ab-4218-9494-6654eb915516",
              name: "email",
              providerId: "user-attribute-ldap-mapper",
              subComponents: {},
              config: {
                "ldap.attribute": [
                  "mail",
                ],
                "is.mandatory.in.ldap": [
                  "false",
                ],
                "always.read.value.from.ldap": [
                  "false",
                ],
                "read.only": [
                  "true",
                ],
                "user.model.attribute": [
                  "email",
                ],
              },
            },
            {
              id: "9d8a61ce-6f4a-4698-9205-b52bad1465a8",
              name: "last name",
              providerId: "user-attribute-ldap-mapper",
              subComponents: {},
              config: {
                "ldap.attribute": [
                  "sn",
                ],
                "is.mandatory.in.ldap": [
                  "true",
                ],
                "always.read.value.from.ldap": [
                  "true",
                ],
                "read.only": [
                  "true",
                ],
                "user.model.attribute": [
                  "lastName",
                ],
              },
            },
            {
              id: "932440c3-8f3e-420f-90ad-8c97266cf20b",
              name: "username",
              providerId: "user-attribute-ldap-mapper",
              subComponents: {},
              config: {
                "ldap.attribute": [
                  "cn",
                ],
                "is.mandatory.in.ldap": [
                  "true",
                ],
                "always.read.value.from.ldap": [
                  "false",
                ],
                "read.only": [
                  "true",
                ],
                "user.model.attribute": [
                  "username",
                ],
              },
            },
            {
              id: "dcd0aafd-6a36-4db3-aaab-9e21575034cd",
              name: "first name",
              providerId: "user-attribute-ldap-mapper",
              subComponents: {},
              config: {
                "ldap.attribute": [
                  "givenName",
                ],
                "is.mandatory.in.ldap": [
                  "true",
                ],
                "always.read.value.from.ldap": [
                  "true",
                ],
                "read.only": [
                  "true",
                ],
                "user.model.attribute": [
                  "firstName",
                ],
              },
            },
            {
              id: "29e35ff2-7be6-4b26-aab5-f01ceb5abd2c",
              name: "modify date",
              providerId: "user-attribute-ldap-mapper",
              subComponents: {},
              config: {
                "ldap.attribute": [
                  "modifyTimestamp",
                ],
                "is.mandatory.in.ldap": [
                  "false",
                ],
                "always.read.value.from.ldap": [
                  "true",
                ],
                "read.only": [
                  "true",
                ],
                "user.model.attribute": [
                  "modifyTimestamp",
                ],
              },
            },
          ],
        },
        config: {
          pagination: [
            "true",
          ],
          fullSyncPeriod: [
            "604800",
          ],
          usersDn: [
            "ou=users,dc=enncloud,dc=com",
          ],
          connectionPooling: [
            "true",
          ],
          cachePolicy: [
            "DEFAULT",
          ],
          useKerberosForPasswordAuthentication: [
            "false",
          ],
          importEnabled: [
            "true",
          ],
          enabled: [
            "true",
          ],
          bindCredential: [
            $._global_config.ldap.admin_password,
          ],
          usernameLDAPAttribute: [
            "cn",
          ],
          changedSyncPeriod: [
            "600",
          ],
          bindDn: [
            "cn=admin,dc=enncloud,dc=com",
          ],
          lastSync: [
            "1533011826",
          ],
          vendor: [
            "other",
          ],
          uuidLDAPAttribute: [
            "entryUUID",
          ],
          allowKerberosAuthentication: [
            "false",
          ],
          connectionUrl: [
            "ldap://ldaps-ha-svc.system-tools:389",
          ],
          syncRegistrations: [
            "false",
          ],
          authType: [
            "simple",
          ],
          debug: [
            "false",
          ],
          searchScope: [
            "2",
          ],
          useTruststoreSpi: [
            "ldapsOnly",
          ],
          priority: [
            "0",
          ],
          userObjectClasses: [
            "inetOrgPerson, organizationalPerson",
          ],
          rdnLDAPAttribute: [
            "cn",
          ],
          editMode: [
            "READ_ONLY",
          ],
          validatePasswordPolicy: [
            "false",
          ],
          batchSizeForSync: [
            "1000",
          ],
        },
      },
    ],
    "org.keycloak.keys.KeyProvider": [
      {
        id: "070a434d-2e30-4b9b-bd33-4f1f7567261b",
        name: "rsa-generated",
        providerId: "rsa-generated",
        subComponents: {},
        config: {
          priority: [
            "100",
          ],
        },
      },
      {
        id: "ba079b20-57ba-4ac2-81a2-41d5fc9c6d95",
        name: "aes-generated",
        providerId: "aes-generated",
        subComponents: {},
        config: {
          priority: [
            "100",
          ],
        },
      },
      {
        id: "89461976-cf41-4896-b63b-e94ff8202cba",
        name: "hmac-generated",
        providerId: "hmac-generated",
        subComponents: {},
        config: {
          priority: [
            "100",
          ],
        },
      },
    ],
  },
  internationalizationEnabled: true,
  supportedLocales: [
    "en",
    "zh-CN",
  ],
  defaultLocale: "zh-CN",
  authenticationFlows: [
    {
      id: "1bef2e15-c136-4340-9214-269f81dc4e33",
      alias: "Handle Existing Account",
      description: "Handle what to do if there is existing account with same email/username like authenticated identity provider",
      providerId: "basic-flow",
      topLevel: false,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "idp-confirm-link",
          requirement: "REQUIRED",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "idp-email-verification",
          requirement: "ALTERNATIVE",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          requirement: "ALTERNATIVE",
          priority: 30,
          flowAlias: "Verify Existing Account by Re-authentication",
          userSetupAllowed: false,
          autheticatorFlow: true,
        },
      ],
    },
    {
      id: "5e26f032-6470-416a-97df-886f83abf37d",
      alias: "Verify Existing Account by Re-authentication",
      description: "Reauthentication of existing account",
      providerId: "basic-flow",
      topLevel: false,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "idp-username-password-form",
          requirement: "REQUIRED",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "auth-otp-form",
          requirement: "OPTIONAL",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
      ],
    },
    {
      id: "d8a206c3-2234-4fb6-969a-1bfb0e177243",
      alias: "browser",
      description: "browser based authentication",
      providerId: "basic-flow",
      topLevel: true,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "auth-cookie",
          requirement: "ALTERNATIVE",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "auth-spnego",
          requirement: "DISABLED",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "identity-provider-redirector",
          requirement: "ALTERNATIVE",
          priority: 25,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          requirement: "ALTERNATIVE",
          priority: 30,
          flowAlias: "forms",
          userSetupAllowed: false,
          autheticatorFlow: true,
        },
      ],
    },
    {
      id: "db8f06ef-182e-4b1f-b5b9-d6e52b97ede5",
      alias: "clients",
      description: "Base authentication for clients",
      providerId: "client-flow",
      topLevel: true,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "client-secret",
          requirement: "ALTERNATIVE",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "client-jwt",
          requirement: "ALTERNATIVE",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "client-secret-jwt",
          requirement: "ALTERNATIVE",
          priority: 30,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
      ],
    },
    {
      id: "99a66b94-712d-4ae0-b4ee-0d7fb5f28455",
      alias: "direct grant",
      description: "OpenID Connect Resource Owner Grant",
      providerId: "basic-flow",
      topLevel: true,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "direct-grant-validate-username",
          requirement: "REQUIRED",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "direct-grant-validate-password",
          requirement: "REQUIRED",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "direct-grant-validate-otp",
          requirement: "OPTIONAL",
          priority: 30,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
      ],
    },
    {
      id: "fba55f15-6705-4358-bf09-662c416e6095",
      alias: "docker auth",
      description: "Used by Docker clients to authenticate against the IDP",
      providerId: "basic-flow",
      topLevel: true,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "docker-http-basic-authenticator",
          requirement: "REQUIRED",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
      ],
    },
    {
      id: "97015346-6508-46a2-a394-0f9341040824",
      alias: "first broker login",
      description: "Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account",
      providerId: "basic-flow",
      topLevel: true,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticatorConfig: "review profile config",
          authenticator: "idp-review-profile",
          requirement: "REQUIRED",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticatorConfig: "create unique user config",
          authenticator: "idp-create-user-if-unique",
          requirement: "ALTERNATIVE",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          requirement: "ALTERNATIVE",
          priority: 30,
          flowAlias: "Handle Existing Account",
          userSetupAllowed: false,
          autheticatorFlow: true,
        },
      ],
    },
    {
      id: "76d1fcc9-5da0-4e49-a323-776a304a84db",
      alias: "forms",
      description: "Username, password, otp and other auth forms.",
      providerId: "basic-flow",
      topLevel: false,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "auth-username-password-form",
          requirement: "REQUIRED",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "auth-otp-form",
          requirement: "OPTIONAL",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
      ],
    },
    {
      id: "5b2d38a9-25bf-49c1-bc0c-8d820cdc4a7d",
      alias: "registration",
      description: "registration flow",
      providerId: "basic-flow",
      topLevel: true,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "registration-page-form",
          requirement: "REQUIRED",
          priority: 10,
          flowAlias: "registration form",
          userSetupAllowed: false,
          autheticatorFlow: true,
        },
      ],
    },
    {
      id: "68bf999b-862e-4343-a3cf-af26bf2aed59",
      alias: "registration form",
      description: "registration form",
      providerId: "form-flow",
      topLevel: false,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "registration-user-creation",
          requirement: "REQUIRED",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "registration-profile-action",
          requirement: "REQUIRED",
          priority: 40,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "registration-password-action",
          requirement: "REQUIRED",
          priority: 50,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "registration-recaptcha-action",
          requirement: "DISABLED",
          priority: 60,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
      ],
    },
    {
      id: "1ee743d8-80f7-4e94-be73-2c62413cebfe",
      alias: "reset credentials",
      description: "Reset credentials for a user if they forgot their password or something",
      providerId: "basic-flow",
      topLevel: true,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "reset-credentials-choose-user",
          requirement: "REQUIRED",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "reset-credential-email",
          requirement: "REQUIRED",
          priority: 20,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "reset-password",
          requirement: "REQUIRED",
          priority: 30,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
        {
          authenticator: "reset-otp",
          requirement: "OPTIONAL",
          priority: 40,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
      ],
    },
    {
      id: "fcd9fae7-3902-4daa-a6fc-e727a6117513",
      alias: "saml ecp",
      description: "SAML ECP Profile Authentication Flow",
      providerId: "basic-flow",
      topLevel: true,
      builtIn: true,
      authenticationExecutions: [
        {
          authenticator: "http-basic-authenticator",
          requirement: "REQUIRED",
          priority: 10,
          userSetupAllowed: false,
          autheticatorFlow: false,
        },
      ],
    },
  ],
  authenticatorConfig: [
    {
      id: "fe361f5b-f98f-4739-9e7e-c5606a3d9ae1",
      alias: "create unique user config",
      config: {
        "require.password.update.after.registration": "false",
      },
    },
    {
      id: "9f19d0ff-f98f-4831-8931-26008e357692",
      alias: "review profile config",
      config: {
        "update.profile.on.first.login": "missing",
      },
    },
  ],
  requiredActions: [
    {
      alias: "CONFIGURE_TOTP",
      name: "Configure OTP",
      providerId: "CONFIGURE_TOTP",
      enabled: true,
      defaultAction: false,
      config: {},
    },
    {
      alias: "UPDATE_PASSWORD",
      name: "Update Password",
      providerId: "UPDATE_PASSWORD",
      enabled: true,
      defaultAction: false,
      config: {},
    },
    {
      alias: "UPDATE_PROFILE",
      name: "Update Profile",
      providerId: "UPDATE_PROFILE",
      enabled: true,
      defaultAction: false,
      config: {},
    },
    {
      alias: "VERIFY_EMAIL",
      name: "Verify Email",
      providerId: "VERIFY_EMAIL",
      enabled: true,
      defaultAction: false,
      config: {},
    },
    {
      alias: "terms_and_conditions",
      name: "Terms and Conditions",
      providerId: "terms_and_conditions",
      enabled: false,
      defaultAction: false,
      config: {},
    },
  ],
  browserFlow: "browser",
  registrationFlow: "registration",
  directGrantFlow: "direct grant",
  resetCredentialsFlow: "reset credentials",
  clientAuthenticationFlow: "clients",
  dockerAuthenticationFlow: "docker auth",
  attributes: {
    "_browser_header.xXSSProtection": "1; mode=block",
    "_browser_header.strictTransportSecurity": "max-age=31536000; includeSubDomains",
    "_browser_header.xFrameOptions": "SAMEORIGIN",
    permanentLockout: "false",
    quickLoginCheckMilliSeconds: "1000",
    "_browser_header.xRobotsTag": "none",
    maxFailureWaitSeconds: "900",
    minimumQuickLoginWaitSeconds: "60",
    failureFactor: "30",
    actionTokenGeneratedByUserLifespan: "300",
    maxDeltaTimeSeconds: "43200",
    "_browser_header.xContentTypeOptions": "nosniff",
    actionTokenGeneratedByAdminLifespan: "43200",
    offlineSessionMaxLifespan: "5184000",
    bruteForceProtected: "false",
    "_browser_header.contentSecurityPolicy": "frame-src 'self'; frame-ancestors 'self'; object-src 'none';",
    offlineSessionMaxLifespanEnabled: "false",
    waitIncrementSeconds: "60",
  },
  keycloakVersion: "4.1.0.Final",
  userManagedAccessAllowed: false,
}
