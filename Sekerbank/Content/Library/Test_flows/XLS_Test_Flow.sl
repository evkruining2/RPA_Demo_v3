namespace: Test_flows
flow:
  name: XLS_Test_Flow
  workflow:
    - XLS_Test:
        do:
          Test_flows.XLS_Test: []
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
      XLS_Test:
        x: 150
        'y': 158
        navigate:
          9ae10fa9-671b-0ea5-c71e-0f47b7a58b20:
            targetId: 54c07110-7e0c-4987-9d2d-0ae372ac8c91
            port: WARNING
          d40274a0-b394-940a-e021-33d0cd295192:
            targetId: 54c07110-7e0c-4987-9d2d-0ae372ac8c91
            port: SUCCESS
    results:
      SUCCESS:
        54c07110-7e0c-4987-9d2d-0ae372ac8c91:
          x: 323
          'y': 52
