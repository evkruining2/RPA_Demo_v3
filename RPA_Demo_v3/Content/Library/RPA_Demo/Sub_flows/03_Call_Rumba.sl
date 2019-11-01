namespace: RPA_Demo.Sub_flows
flow:
  name: 03_Call_Rumba
  inputs:
    - itemNumber
    - itemName
    - SAPCode
  workflow:
    - 03_Rumba_Activity:
        do:
          RPA_Demo.Sub_flows.03_Rumba_Activity:
            - name: '${itemName}'
            - sapcode: '${SAPCode}'
            - ID: '${itemNumber}'
        publish:
          - MFmessage
          - return_result
          - error_message
        navigate:
          - SUCCESS: sleep
          - WARNING: sleep
          - FAILURE: on_failure
    - sleep:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '5'
        navigate:
          - SUCCESS: 03_Run_Report_Phase_3
          - FAILURE: on_failure
    - 03_Run_Report_Phase_3:
        do:
          RPA_Demo.Sub_flows.03_Run_Report_Phase_3:
            - MFmessage: '${MFmessage}'
        publish:
          - return_result
          - error_message
        navigate:
          - SUCCESS: sleep_1
          - WARNING: sleep_1
          - FAILURE: on_failure
    - sleep_1:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '5'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - MFmessage: '${MFmessage}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      03_Rumba_Activity:
        x: 70
        'y': 190
      sleep:
        x: 265
        'y': 184
      03_Run_Report_Phase_3:
        x: 437
        'y': 183
      sleep_1:
        x: 660
        'y': 209
        navigate:
          1f9f8ad3-b8c6-813d-2c2f-eae4f957b005:
            targetId: eb2fd670-fee4-3591-c063-3f7724499e9b
            port: SUCCESS
    results:
      SUCCESS:
        eb2fd670-fee4-3591-c063-3f7724499e9b:
          x: 811
          'y': 208
