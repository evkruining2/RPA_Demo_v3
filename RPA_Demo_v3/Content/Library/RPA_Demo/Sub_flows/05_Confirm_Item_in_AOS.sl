namespace: RPA_Demo.Sub_flows
flow:
  name: 05_Confirm_Item_in_AOS
  inputs:
    - itemName
    - START
  workflow:
    - 05_Check_AOS_Store:
        do:
          RPA_Demo.Sub_flows.05_Check_AOS_Store:
            - itemName: '${itemName}'
        navigate:
          - SUCCESS: sleep
          - WARNING: sleep
          - FAILURE: on_failure
    - sleep:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '10'
        navigate:
          - SUCCESS: End_time_1
          - FAILURE: on_failure
    - 05_Run_Report_Phase_5:
        do:
          RPA_Demo.Sub_flows.05_Run_Report_Phase_5:
            - Duration: '${ELAPSED}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - End_time_1:
        do:
          io.cloudslang.base.python.python_script:
            - script: |-
                import calendar,time
                print(calendar.timegm(time.gmtime()))
        publish:
          - END: '${return_result.strip()}'
        navigate:
          - SUCCESS: Elapsed_time_1
          - FAILURE: on_failure
    - Elapsed_time_1:
        do:
          io.cloudslang.base.math.subtract_numbers:
            - value1: '${END}'
            - value2: '${START}'
        publish:
          - ELAPSED: '${result}'
        navigate:
          - SUCCESS: 05_Run_Report_Phase_5
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      05_Check_AOS_Store:
        x: 145
        'y': 166
      sleep:
        x: 307
        'y': 80
      05_Run_Report_Phase_5:
        x: 750
        'y': 154
        navigate:
          6ca7fe3b-2475-36dc-9905-0d1c576dbd9d:
            targetId: 58bdf609-59b1-a250-5a24-21695ad80e8d
            port: WARNING
          57584b80-4f94-a1d2-cd2e-8d554b02aebb:
            targetId: 58bdf609-59b1-a250-5a24-21695ad80e8d
            port: SUCCESS
      End_time_1:
        x: 459
        'y': 86
      Elapsed_time_1:
        x: 606
        'y': 92
    results:
      SUCCESS:
        58bdf609-59b1-a250-5a24-21695ad80e8d:
          x: 858
          'y': 331
