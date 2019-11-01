namespace: RPA_Demo.Testing
flow:
  name: 05_test
  workflow:
    - Set_Start_Time:
        do:
          io.cloudslang.base.python.python_script:
            - script: |-
                import calendar,time
                print(calendar.timegm(time.gmtime()))
        publish:
          - START: '${return_result.strip()}'
          - path: "${get_sp('Report.SysProp2')+'\\\\'+str(START)}"
          - mailBody_00: |
              <head>
              <style>
        navigate:
          - SUCCESS: sleep
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
    - sleep:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '2'
        navigate:
          - SUCCESS: End_time_1
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Set_Start_Time:
        x: 56
        'y': 96
      05_Run_Report_Phase_5:
        x: 544
        'y': 335
        navigate:
          5ef97e11-6a88-e5bf-d314-e9293b77ac33:
            targetId: d33dac0a-d24d-8a46-ffcf-7f98e6ca3c64
            port: SUCCESS
          fcb4792c-fa30-b35e-09c9-075188110467:
            targetId: d33dac0a-d24d-8a46-ffcf-7f98e6ca3c64
            port: WARNING
      End_time_1:
        x: 373
        'y': 88
      Elapsed_time_1:
        x: 518
        'y': 91
      sleep:
        x: 207
        'y': 127
    results:
      SUCCESS:
        d33dac0a-d24d-8a46-ffcf-7f98e6ca3c64:
          x: 675
          'y': 509
