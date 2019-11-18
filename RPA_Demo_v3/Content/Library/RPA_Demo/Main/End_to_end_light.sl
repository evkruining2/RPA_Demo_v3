namespace: RPA_Demo.Main
flow:
  name: End_to_end_light
  inputs:
    - rownumber: '2'
    - csvfile: "C:\\Demo\\Data\\laptops.csv"
  workflow:
    - Select_Row_from_CSV:
        do:
          RPA_Demo.Sub_flows.Select_Row_from_CSV:
            - rowNumer: '${rownumber}'
            - csvfile: '${csvfile}'
        publish:
          - itemNumber
          - itemName
          - itemDesc
          - itemPrice
        navigate:
          - SUCCESS: Process_Flow_Light
    - Cleanup_Environment:
        do:
          RPA_Demo.Sub_flows.Cleanup_Environment:
            - processNames: Firefox.exe
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
    - Process_Flow_Light:
        do:
          RPA_Demo.Sub_flows.Process_Flow_Light:
            - itemName: '${itemName}'
            - itemNumber: '${itemNumber}'
            - itemDesc: '${itemDesc}'
            - itemPrice: '${itemPrice}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Cleanup_Environment
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Select_Row_from_CSV:
        x: 73
        'y': 90
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
      Process_Flow_Light:
        x: 294
        'y': 88
    results:
      SUCCESS:
        6e0484df-4790-0c4a-df43-4138172c4192:
          x: 664
          'y': 327
