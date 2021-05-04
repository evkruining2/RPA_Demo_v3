########################################################################################################################
#!!
#! @input pattern: host pattern
#! @input inventory: specify inventory host path or comma separated host list
#! @input subset: further limit selected hosts to an additional pattern
#! @input ansible_module: module name to execute (default=command)
#! @input module_arguments: module arguments
#! @input extra_vars: set additional variables as key=value or YAML/JSON, if filename prepend with @
#!!#
########################################################################################################################
namespace: Ansible_CLI
flow:
  name: Ansible_CLI
  inputs:
    - ansible_host
    - ansible_username
    - ansible_password:
        sensitive: true
    - pattern: all
    - inventory:
        required: false
    - subset:
        required: false
    - ansible_module:
        default: ping
        required: false
    - module_arguments:
        required: false
    - extra_vars:
        required: false
  workflow:
    - contruct_ssh_command:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: 'ansible '
            - text: '${pattern}'
        publish:
          - ssh_command: '${new_string}'
        navigate:
          - SUCCESS: check_subset_var
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${ansible_host}'
            - command: '${ssh_command}'
            - username: '${ansible_username}'
            - password:
                value: '${ansible_password}'
                sensitive: true
            - timeout: '600000'
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
    - check_subset_var:
        do:
          io.cloudslang.base.utils.is_null:
            - variable: '${subset}'
        publish: []
        navigate:
          - IS_NULL: check_intentory_var
          - IS_NOT_NULL: append_subset
    - append_subset:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: '${ssh_command}'
            - text: "${' -l '+subset}"
        publish:
          - ssh_command: '${new_string}'
        navigate:
          - SUCCESS: check_intentory_var
    - check_intentory_var:
        do:
          io.cloudslang.base.utils.is_null:
            - variable: '${inventory}'
        navigate:
          - IS_NULL: check_module_var
          - IS_NOT_NULL: append_inventory
    - append_inventory:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: '${ssh_command}'
            - text: "${' -i '+inventory}"
        publish:
          - ssh_command: '${new_string}'
        navigate:
          - SUCCESS: check_module_var
    - check_module_var:
        do:
          io.cloudslang.base.utils.is_null:
            - variable: '${ansible_module}'
        navigate:
          - IS_NULL: check_module_args
          - IS_NOT_NULL: append_module
    - append_module:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: '${ssh_command}'
            - text: "${' -m '+ansible_module}"
        publish:
          - ssh_command: '${new_string}'
        navigate:
          - SUCCESS: check_module_args
    - append_module_args:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: '${ssh_command}'
            - text: "${' -a \"'+module_arguments+'\"'}"
        publish:
          - ssh_command: '${new_string}'
        navigate:
          - SUCCESS: check_extra_vars
    - check_module_args:
        do:
          io.cloudslang.base.utils.is_null:
            - variable: '${module_arguments}'
        navigate:
          - IS_NULL: check_extra_vars
          - IS_NOT_NULL: append_module_args
    - check_extra_vars:
        do:
          io.cloudslang.base.utils.is_null:
            - variable: '${extra_vars}'
        navigate:
          - IS_NULL: ssh_command
          - IS_NOT_NULL: append_extra_vars
    - append_extra_vars:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: '${ssh_command}'
            - text: "${' -e \"'+extra_vars+'\"'}"
        publish:
          - ssh_command: '${new_string}'
        navigate:
          - SUCCESS: ssh_command
  outputs:
    - error_message: '${error_message}'
    - stdout: '${output}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      append_extra_vars:
        x: 864
        'y': 428
      check_subset_var:
        x: 118
        'y': 242
      append_subset:
        x: 207
        'y': 72
      something_went_wrong:
        x: 299
        'y': 422
        navigate:
          6ec9b37e-fdb7-4fc1-a33c-2eb1a02be78e:
            targetId: e87f8329-f2ad-d5a2-046c-cc583d282bfe
            port: SUCCESS
      append_module_args:
        x: 774
        'y': 70
      check_intentory_var:
        x: 294
        'y': 242
      check_module_var:
        x: 476
        'y': 239
      check_command_return_code:
        x: 478
        'y': 430
        navigate:
          390a904f-acf3-8745-17a7-8e17774c9442:
            targetId: c03bc0a5-a290-a627-f56c-bc434ca4c253
            port: EQUALS
      append_module:
        x: 569
        'y': 67
      check_extra_vars:
        x: 865
        'y': 239
      ssh_command:
        x: 667
        'y': 423
      append_inventory:
        x: 382
        'y': 71
      check_module_args:
        x: 667
        'y': 237
      contruct_ssh_command:
        x: 37
        'y': 74
    results:
      SUCCESS:
        c03bc0a5-a290-a627-f56c-bc434ca4c253:
          x: 476
          'y': 607
      FAILURE:
        e87f8329-f2ad-d5a2-046c-cc583d282bfe:
          x: 118
          'y': 435
