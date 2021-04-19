namespace: RPA_Demo.API_Automation
flow:
  name: Get_SSN_from_MySQL_Windows
  inputs:
    - name:
        prompt:
          type: text
        default: steve
  workflow:
    - run_command:
        do:
          io.cloudslang.base.cmd.run_command:
            - command: "${'mysql.exe -u root -N ssn -e \"select ssn from ssn where name='+\"'\"+name+\"'\"+'\"'}"
            - cwd: "C:\\Program Files\\OrangeHRM\\4.6\\mysql\\bin"
        publish:
          - ssn: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - ssn: '${ssn}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      run_command:
        x: 178
        'y': 108
        navigate:
          ac9bd98e-b0d8-0f9d-3cea-8fcee43f6cf3:
            targetId: b05f127a-62b8-70e3-40b9-1e602f977f33
            port: SUCCESS
    results:
      SUCCESS:
        b05f127a-62b8-70e3-40b9-1e602f977f33:
          x: 336
          'y': 92
