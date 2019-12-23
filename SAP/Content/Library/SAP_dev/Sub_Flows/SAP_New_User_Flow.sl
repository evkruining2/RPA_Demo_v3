namespace: SAP_dev.Sub_Flows
flow:
  name: SAP_New_User_Flow
  inputs:
    - firstName
    - lastName
    - email
    - UID
  workflow:
    - SAP_New_User_1:
        do:
          SAP_dev.Sub_Flows.SAP_New_User:
            - UID: '${UID}'
            - firstName: '${firstName}'
            - lastName: '${lastName}'
            - email: '${email}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      SAP_New_User_1:
        x: 92
        'y': 73
        navigate:
          6910f3a7-c950-fd1e-86a1-27a80c023ca6:
            targetId: 5bb3d59b-c3b1-98d0-47c2-14bf1856d2de
            port: SUCCESS
          d934a281-6e48-51c5-d380-73c1758983d9:
            targetId: 5bb3d59b-c3b1-98d0-47c2-14bf1856d2de
            port: WARNING
    results:
      SUCCESS:
        5bb3d59b-c3b1-98d0-47c2-14bf1856d2de:
          x: 366
          'y': 57
