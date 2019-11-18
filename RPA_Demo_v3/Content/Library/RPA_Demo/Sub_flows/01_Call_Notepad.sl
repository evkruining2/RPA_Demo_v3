namespace: RPA_Demo.Sub_flows
flow:
  name: 01_Call_Notepad
  inputs:
    - itemName
    - itemNumber
    - itemDesc
    - itemPrice
    - sleepTimer: '1'
  workflow:
    - Get_Time:
        do:
          RPA_Demo.Tools.Get_Time: []
        publish:
          - Current_Time
        navigate:
          - FAILURE: on_failure
          - SUCCESS: 01_Run_Report_Phase_1
    - 01_Run_Report_Phase_1:
        do:
          RPA_Demo.Sub_flows.01_Run_Report_Phase_1:
            - Current_Time: '${Current_Time}'
            - itemName: '${itemName}'
            - itemNumber: '${itemNumber}'
            - itemDesc: '${itemDesc}'
            - itemPrice: '${itemPrice}'
        navigate:
          - SUCCESS: sleep
          - WARNING: sleep
          - FAILURE: on_failure
    - sleep:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '${sleepTimer}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Get_Time:
        x: 119
        'y': 158
      01_Run_Report_Phase_1:
        x: 306
        'y': 166
      sleep:
        x: 486
        'y': 170
        navigate:
          ab893bc1-609d-f217-6a7a-4e2c9a34b4e6:
            targetId: 2bf61e12-a732-81f6-2ad1-b0798c848b17
            port: SUCCESS
    results:
      SUCCESS:
        2bf61e12-a732-81f6-2ad1-b0798c848b17:
          x: 646
          'y': 174
