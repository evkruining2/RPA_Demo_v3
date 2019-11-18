namespace: Test_flows
flow:
  name: Test_RPA_01
  workflow:
    - get_time:
        do:
          io.cloudslang.base.datetime.get_time:
            - timezone: CET
        publish:
          - output
        navigate:
          - SUCCESS: 01_Run_Report_Phase_1
          - FAILURE: on_failure
    - 01_Run_Report_Phase_1:
        do:
          RPA_Demo.Sub_flows.01_Run_Report_Phase_1:
            - Current_Time: '${output}'
            - itemName: itemName
            - itemNumber: itemNumber
            - itemDesc: item Description
            - itemPrice: itemPrice
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
      01_Run_Report_Phase_1:
        x: 200
        'y': 142
        navigate:
          4a1fec84-748d-a3f9-af6e-a1c62d9d45f6:
            targetId: 5d60da83-3673-e165-bf85-e21f727c64c9
            port: SUCCESS
          fa115704-f5ef-771f-8c99-4e932b59386e:
            targetId: 5d60da83-3673-e165-bf85-e21f727c64c9
            port: WARNING
      get_time:
        x: 75
        'y': 80
    results:
      SUCCESS:
        5d60da83-3673-e165-bf85-e21f727c64c9:
          x: 416
          'y': 262
