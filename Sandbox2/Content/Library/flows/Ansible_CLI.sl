namespace: flows
flow:
  name: Ansible_CLI
  inputs:
    - ansible_host
    - ansible_username
    - ansible_password:
        sensitive: true
    - pattern
    - inventory:
        required: false
    - subset:
        required: false
    - ansible_module:
        default: ping
        required: false
    - module_arguments:
        required: false
    - extra_arguments:
        required: false
  workflow:
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${ansible_host}'
            - command: "${'ansible '+pattern+' -m '+ansible_module}"
            - username: '${ansible_username}'
            - password:
                value: '${ansible_password}'
                sensitive: true
        publish:
          - output: '${return_result}'
          - command_return_code
        navigate:
          - SUCCESS: check_command_return_code
          - FAILURE: on_failure
    - check_command_return_code:
        do:
          io.cloudslang.base.math.compare_numbers:
            - value1: '${command_return_code}'
            - value2: '0'
        navigate:
          - GREATER_THAN: something_went_wrong
          - EQUALS: SUCCESS
          - LESS_THAN: something_went_wrong
    - something_went_wrong:
        do:
          io.cloudslang.base.utils.do_nothing:
            - error_message: '${output}'
        publish:
          - error_message
        navigate:
          - SUCCESS: FAILURE
          - FAILURE: on_failure
  outputs:
    - error_message: '${error_message}'
    - stdout: '${output}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      ssh_command:
        x: 70
        'y': 85
      check_command_return_code:
        x: 75
        'y': 252
        navigate:
          390a904f-acf3-8745-17a7-8e17774c9442:
            targetId: c03bc0a5-a290-a627-f56c-bc434ca4c253
            port: EQUALS
      something_went_wrong:
        x: 76
        'y': 418
        navigate:
          6ec9b37e-fdb7-4fc1-a33c-2eb1a02be78e:
            targetId: e87f8329-f2ad-d5a2-046c-cc583d282bfe
            port: SUCCESS
    results:
      SUCCESS:
        c03bc0a5-a290-a627-f56c-bc434ca4c253:
          x: 317
          'y': 251
      FAILURE:
        e87f8329-f2ad-d5a2-046c-cc583d282bfe:
          x: 311
          'y': 412
