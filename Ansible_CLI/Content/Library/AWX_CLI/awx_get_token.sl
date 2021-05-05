namespace: AWX_CLI
flow:
  name: awx_get_token
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
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${awx_cli_host}'
            - command: "${'awx --conf.host '+awx_host+' --conf.username '+awx_username+' --conf.password '+awx_password+' login'}"
            - username: '${awx_cli_username}'
            - password:
                value: '${awx_cli_password}'
                sensitive: true
        publish:
          - return_result: '${cs_substring(cs_json_query(return_result,"$.token"),2,-2)}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - token: '${return_result}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      ssh_command:
        x: 138
        'y': 128.5
        navigate:
          a9c7bc50-dced-ce7b-6a9a-627ce5f676c5:
            targetId: 99c45cac-e9fd-eac0-4f42-a4fadd13900c
            port: SUCCESS
    results:
      SUCCESS:
        99c45cac-e9fd-eac0-4f42-a4fadd13900c:
          x: 320
          'y': 126