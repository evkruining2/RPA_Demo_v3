namespace: Ansible_CLI.Samples
flow:
  name: Run_simple_playbook_on_one_target
  inputs:
    - host
    - username
    - password:
        sensitive: true
    - playbook: /var/lib/awx/projects/reboot.yaml
    - inventory:
        default: /root/ahosts
        required: false
    - subset:
        default: at1
        required: false
  workflow:
    - Ansible_Playbook_CLI:
        do:
          Ansible_CLI.Ansible_Playbook_CLI:
            - ansible_host: '${host}'
            - ansible_username: '${username}'
            - ansible_password:
                value: '${password}'
                sensitive: true
            - playbook: '${playbook}'
            - inventory: '${inventory}'
            - subset: '${subset}'
            - additional_options: '-v'
        publish:
          - error_message
          - stdout
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - stfout: '${stdout}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      Ansible_Playbook_CLI:
        x: 101
        'y': 108
        navigate:
          704c2657-06e9-bc8c-8863-176554fa060b:
            targetId: 0a3d0ee7-e02f-4f2e-de7b-39847c88a0f0
            port: SUCCESS
    results:
      SUCCESS:
        0a3d0ee7-e02f-4f2e-de7b-39847c88a0f0:
          x: 318
          'y': 98
