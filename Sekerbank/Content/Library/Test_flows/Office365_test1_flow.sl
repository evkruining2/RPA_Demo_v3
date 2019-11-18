namespace: Test_flows
flow:
  name: Office365_test1_flow
  workflow:
    - Office365_test1:
        do:
          Test_flows.Office365_test1: []
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
      Office365_test1:
        x: 137
        'y': 165
        navigate:
          f8971988-9b49-87a5-d993-af7b7f4625c5:
            targetId: f4e4f69e-4eb1-5f55-86e7-8ef7bb02a664
            port: SUCCESS
          c5944498-dd89-e4d0-a425-f9fdb32a829b:
            targetId: f4e4f69e-4eb1-5f55-86e7-8ef7bb02a664
            port: WARNING
    results:
      SUCCESS:
        f4e4f69e-4eb1-5f55-86e7-8ef7bb02a664:
          x: 406
          'y': 139
