########################################################################################################################
#!!
#! @description: Get a list of credential stores
#!
#! @output credentials: List of credential stores
#!!#
########################################################################################################################
namespace: AWX_CLI.Samples
flow:
  name: list_credentials
  inputs:
    - awx_cli_host: 192.168.2.123
    - awx_cli_username: root
    - awx_cli_password:
        default: opsware
        sensitive: true
    - awx_host: 'http://192.168.2.123'
    - awx_username: admin
    - awx_password:
        default: opsware
        sensitive: true
  workflow:
    - awx_get_token:
        do:
          AWX_CLI.awx_get_token:
            - awx_cli_host: '${awx_cli_host}'
            - awx_cli_username: '${awx_cli_username}'
            - awx_cli_password:
                value: '${awx_cli_password}'
                sensitive: true
            - awx_host: '${awx_host}'
            - awx_username: '${awx_username}'
            - awx_password:
                value: '${awx_password}'
                sensitive: true
        publish:
          - token
        navigate:
          - FAILURE: on_failure
          - SUCCESS: list_credentials
    - list_credentials:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${awx_cli_host}'
            - command: "${'awx --conf.host '+awx_host+' --conf.token '+token+' credentials list -f human --all'}"
            - username: '${awx_cli_username}'
            - password:
                value: '${awx_cli_password}'
                sensitive: true
            - character_set: null
            - use_shell: null
            - remove_escape_sequences: 'true'
        publish:
          - credentials: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - credentials: '${credentials}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      awx_get_token:
        x: 134
        'y': 121.5
      list_credentials:
        x: 341
        'y': 124
        navigate:
          747208f5-8f40-5c4f-72df-793a101c5143:
            targetId: ca0f2697-593d-a271-a16c-fb27d8c51410
            port: SUCCESS
    results:
      SUCCESS:
        ca0f2697-593d-a271-a16c-fb27d8c51410:
          x: 506
          'y': 110.5
