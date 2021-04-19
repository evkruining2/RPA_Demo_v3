namespace: RPA_Demo.API_Automation
flow:
  name: Get_SSN_from_MySQL
  inputs:
    - name:
        prompt:
          type: text
        default: steve
  workflow:
    - ssh_command:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: 192.168.2.187
            - command: "${'mysql -N ssn -e \\\"select ssn from ssn where name=\\''+name+'\\'\\\"'}"
            - username: root
            - password:
                value: opsware
                sensitive: true
        publish:
          - ssn: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - ssn: '${ssn}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      ssh_command:
        x: 109
        'y': 151
        navigate:
          dbc5cc69-99d3-9286-7616-1c5dae357bd5:
            targetId: 1b2dfaf6-ca77-2d41-34cd-82660c62099e
            port: SUCCESS
    results:
      SUCCESS:
        1b2dfaf6-ca77-2d41-34cd-82660c62099e:
          x: 304
          'y': 146
