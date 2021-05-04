namespace: flows
flow:
  name: Ansible_Playbook_CLI
  inputs:
    - ansible_host
    - ansible_username
    - ansible_password
  workflow:
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${ansible_host}'
            - command: ansible-playbook
            - username: '${ansible_username}'
            - password:
                value: '${ansible_password}'
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      ssh_command:
        x: 134
        'y': 169
        navigate:
          8d0d1d3a-b20f-9c4b-fe58-4462de8d5d06:
            targetId: c3f8f17c-5c1f-fdcf-6d26-0dcaf2e08f85
            port: SUCCESS
    results:
      SUCCESS:
        c3f8f17c-5c1f-fdcf-6d26-0dcaf2e08f85:
          x: 364
          'y': 194
