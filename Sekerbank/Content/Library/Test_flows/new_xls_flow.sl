namespace: Test_flows
flow:
  name: new_xls_flow
  workflow:
    - new_xls:
        do:
          Test_flows.new_xls: []
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
      new_xls:
        x: 135
        'y': 147
        navigate:
          9b7f18af-d1bd-6e25-979d-3bdbc3fe94ab:
            targetId: 22a6f613-7366-1f07-265b-e35b7ab2f1fb
            port: SUCCESS
          ad538ab5-924e-c925-9624-7a3c463c58d6:
            targetId: 22a6f613-7366-1f07-265b-e35b7ab2f1fb
            port: WARNING
    results:
      SUCCESS:
        22a6f613-7366-1f07-265b-e35b7ab2f1fb:
          x: 360
          'y': 224
