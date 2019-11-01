namespace: RPA_Demo.Testing
flow:
  name: 03_Call_Rumba_test
  inputs:
    - itemNumber: '66398'
    - itemName: ARIE
    - SAPCode: '1040'
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
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
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
        x: 292
        'y': 158
      03_Run_Report_Phase_3:
        x: 461
        'y': 184
        navigate:
          8fd8730a-9e84-6854-b72c-8c0e52256e00:
            targetId: eb2fd670-fee4-3591-c063-3f7724499e9b
            port: SUCCESS
          871f1128-90d1-96ba-626d-6f8847712216:
            targetId: eb2fd670-fee4-3591-c063-3f7724499e9b
            port: WARNING
    results:
      SUCCESS:
        eb2fd670-fee4-3591-c063-3f7724499e9b:
          x: 630
          'y': 371
