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
    - is_null:
        do:
          io.cloudslang.base.utils.is_null:
            - variable: '${extra_arguments}'
        navigate:
          - IS_NULL: SUCCESS
          - IS_NOT_NULL: ssh_command
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
        navigate:
          - SUCCESS: Is_any_host_unreachable
          - FAILURE: on_failure
    - Is_any_host_unreachable:
        do:
          io.cloudslang.base.strings.string_occurrence_counter:
            - string_in_which_to_search: '${output}'
            - string_to_find: UNREACH
        publish:
          - return_result
        navigate:
          - SUCCESS: Count_unreachables
          - FAILURE: Count_unreachables
    - Count_unreachables:
        do:
          io.cloudslang.base.math.compare_numbers:
            - value1: '${return_result}'
            - value2: '0'
        navigate:
          - GREATER_THAN: FAILURE
          - EQUALS: Did_any_host_fail
          - LESS_THAN: Did_any_host_fail
    - Did_any_host_fail:
        do:
          io.cloudslang.base.strings.string_occurrence_counter:
            - string_in_which_to_search: '${output}'
            - string_to_find: FAIL
        publish:
          - return_result
        navigate:
          - SUCCESS: Count_failures
          - FAILURE: Count_failures
    - Count_failures:
        do:
          io.cloudslang.base.math.compare_numbers:
            - value1: '${return_result}'
            - value2: '0'
        navigate:
          - GREATER_THAN: FAILURE
          - EQUALS: SUCCESS
          - LESS_THAN: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      ssh_command:
        x: 70
        'y': 86
      Count_unreachables:
        x: 80
        'y': 438
        navigate:
          c44565d9-a940-a79c-f625-28596b7ca491:
            targetId: dc3137f6-413d-6abc-141a-14d48d141f2d
            port: GREATER_THAN
      Did_any_host_fail:
        x: 253
        'y': 253
      Is_any_host_unreachable:
        x: 77
        'y': 256
      Count_failures:
        x: 246
        'y': 441
        navigate:
          13ef2f9c-3122-8ad0-1b66-3cb720172ec0:
            targetId: c03bc0a5-a290-a627-f56c-bc434ca4c253
            port: EQUALS
          9f0ec4f4-bb35-3f7d-baae-631f2a9b2f02:
            targetId: dc3137f6-413d-6abc-141a-14d48d141f2d
            port: GREATER_THAN
          e3eb3654-2b91-d9c0-f895-51fe304d1bd4:
            targetId: c03bc0a5-a290-a627-f56c-bc434ca4c253
            port: LESS_THAN
      is_null:
        x: 728
        'y': 211
        navigate:
          73cfd8fc-665a-c1e9-8e81-e698b33efb9a:
            targetId: c03bc0a5-a290-a627-f56c-bc434ca4c253
            port: IS_NULL
    results:
      SUCCESS:
        c03bc0a5-a290-a627-f56c-bc434ca4c253:
          x: 466
          'y': 434
      FAILURE:
        dc3137f6-413d-6abc-141a-14d48d141f2d:
          x: 173
          'y': 624
