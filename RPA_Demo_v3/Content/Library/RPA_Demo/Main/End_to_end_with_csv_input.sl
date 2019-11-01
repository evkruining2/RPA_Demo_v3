namespace: RPA_Demo.Main
flow:
  name: End_to_end_with_csv_input
  inputs:
    - rownumber
    - csvfile: "C:\\Enablement\\Hackton\\data\\laptops.csv"
  workflow:
    - Select_Row_from_CSV:
        do:
          RPA_Demo.Sub_flows.Select_Row_from_CSV:
            - rowNumer: '${rownumber}'
        publish:
          - itemNumber
          - itemName
          - itemDesc
          - itemPrice
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Process_Flow
    - Process_Flow:
        do:
          RPA_Demo.Sub_flows.Process_Flow:
            - itemName: '${itemName}'
            - itemNumber: '${itemNumber}'
            - itemDesc: '${itemDesc}'
            - itemPrice: '${itemPrice}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Cleanup_Environment
    - Cleanup_Environment:
        do:
          RPA_Demo.Sub_flows.Cleanup_Environment: []
        navigate:
          - SUCCESS: Delete_row_from_CSV
          - FAILURE: on_failure
    - Delete_row_from_CSV:
        do:
          RPA_Demo.Sub_flows.Delete_row_from_CSV:
            - csvfile: '${csvfile}'
            - row: '${rownumber}'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Select_Row_from_CSV:
        x: 73
        'y': 90
      Process_Flow:
        x: 271
        'y': 92
      Cleanup_Environment:
        x: 474
        'y': 101
      Delete_row_from_CSV:
        x: 669
        'y': 107
        navigate:
          7df4f590-1fe1-1b22-4e57-07a651d5c38f:
            targetId: 6e0484df-4790-0c4a-df43-4138172c4192
            port: SUCCESS
    results:
      SUCCESS:
        6e0484df-4790-0c4a-df43-4138172c4192:
          x: 664
          'y': 327
