########################################################################################################################
#!!
#! @description: Get a job status, identified by the job ID
#!
#! @input job_id: Job ID
#!!#
########################################################################################################################
namespace: AWX_CLI.Samples
flow:
  name: get_job_status
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
    - job_id: '35'
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
          - SUCCESS: get_job_status
    - get_job_status:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${awx_cli_host}'
            - command: "${'awx --conf.host '+awx_host+' --conf.token '+token+' jobs get '+job_id}"
            - username: '${awx_cli_username}'
            - password:
                value: '${awx_cli_password}'
                sensitive: true
            - character_set: null
            - use_shell: null
            - remove_escape_sequences: 'true'
        publish:
          - job_details: '${return_result}'
          - job_status: '${cs_substring(cs_json_query(return_result,"$.status"),2,-2)}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - job_details: '${job_details}'
    - job_status: '${job_status}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      awx_get_token:
        x: 134
        'y': 121.5
      get_job_status:
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
