namespace: RPA_Demo.Sub_flows
flow:
  name: 02_Call_SAP
  workflow:
    - 02_SAP_Activity_1:
        do:
          RPA_Demo.Sub_flows.02_SAP_Activity: []
        publish:
          - SAPcode
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
          - SUCCESS: 02_Run_Report_Phase_2
          - FAILURE: on_failure
    - 02_Run_Report_Phase_2:
        do:
          RPA_Demo.Sub_flows.02_Run_Report_Phase_2:
            - SAPcode: '${SAPcode}'
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
    - SAPcode: '${SAPcode}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      02_SAP_Activity_1:
        x: 72
        'y': 165
      sleep:
        x: 278
        'y': 156
      02_Run_Report_Phase_2:
        x: 440
        'y': 143
      sleep_1:
        x: 603
        'y': 158
        navigate:
          c2429138-3516-d83e-24c2-3e18294895fd:
            targetId: 703d400f-030f-7866-66ae-398f8151cb1c
            port: SUCCESS
    results:
      SUCCESS:
        703d400f-030f-7866-66ae-398f8151cb1c:
          x: 767
          'y': 170
