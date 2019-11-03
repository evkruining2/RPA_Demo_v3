namespace: RPA_Demo.Test
flow:
  name: Iterator_test
  workflow:
    - Select_Row_from_CSV:
        do:
          RPA_Demo.Sub_flows.Select_Row_from_CSV:
            - rowNumer: '1'
        publish:
          - itemNumber
          - itemName
          - itemDesc
          - itemPrice
        navigate:
          - SUCCESS: Cleanup_Environment
    - Cleanup_Environment:
        do:
          RPA_Demo.Sub_flows.Cleanup_Environment: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Select_Row_from_CSV:
        x: 151
        'y': 105
      Cleanup_Environment:
        x: 382
        'y': 100
        navigate:
          aef7d624-0e74-b56c-0d8c-032c3d8027b8:
            targetId: 8148a1af-67da-6226-c54b-1e5a70e67f16
            port: SUCCESS
    results:
      SUCCESS:
        8148a1af-67da-6226-c54b-1e5a70e67f16:
          x: 379
          'y': 304
