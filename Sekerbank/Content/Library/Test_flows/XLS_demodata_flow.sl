namespace: Test_flows
flow:
  name: XLS_demodata_flow
  workflow:
    - XLS_demodata:
        do:
          Test_flows.XLS_demodata: []
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
      XLS_demodata:
        x: 158
        'y': 118
        navigate:
          ccf64a68-42e0-b0da-f765-3a499e195f4b:
            targetId: f0453173-e923-870b-df78-9cac958dc586
            port: SUCCESS
          2cd78311-95e7-f373-61ee-746c81c941e2:
            targetId: f0453173-e923-870b-df78-9cac958dc586
            port: WARNING
    results:
      SUCCESS:
        f0453173-e923-870b-df78-9cac958dc586:
          x: 340
          'y': 206
