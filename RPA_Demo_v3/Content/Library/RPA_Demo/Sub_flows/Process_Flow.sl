namespace: RPA_Demo.Sub_flows
flow:
  name: Process_Flow
  inputs:
    - itemName
    - itemNumber
    - itemDesc
    - itemPrice
  workflow:
    - Set_Start_Time:
        do:
          io.cloudslang.base.python.python_script:
            - script: |-
                import calendar,time
                print(calendar.timegm(time.gmtime()))
        publish:
          - START: '${return_result.strip()}'
        navigate:
          - SUCCESS: 01_Call_Notepad
          - FAILURE: on_failure
    - 01_Call_Notepad:
        do:
          RPA_Demo.Sub_flows.01_Call_Notepad:
            - itemName: '${itemName}'
            - itemNumber: '${itemNumber}'
            - itemDesc: '${itemDesc}'
            - itemPrice: '${itemPrice}'
        navigate:
          - FAILURE: End_time
          - SUCCESS: 02_Call_SAP
    - 02_Call_SAP:
        do:
          RPA_Demo.Sub_flows.02_Call_SAP: []
        publish:
          - SAPcode
        navigate:
          - SUCCESS: 03_Call_Rumba
          - FAILURE: End_time
    - 03_Call_Rumba:
        do:
          RPA_Demo.Sub_flows.03_Call_Rumba:
            - itemNumber: '${itemNumber}'
            - itemName: '${itemName}'
            - SAPCode: '${SAPcode}'
        navigate:
          - SUCCESS: 04_Add_Item_in_AOS_Catalog
          - FAILURE: End_time
    - 04_Add_Item_in_AOS_Catalog:
        do:
          RPA_Demo.Sub_flows.04_Add_Item_in_AOS_Catalog:
            - itemName: '${itemName}'
            - itemNumber: '${itemNumber}'
            - itemDesc: '${itemDesc}'
            - itemPrice: '${itemPrice}'
        navigate:
          - FAILURE: End_time
          - SUCCESS: 05_Confirm_Item_in_AOS
    - 05_Confirm_Item_in_AOS:
        do:
          RPA_Demo.Sub_flows.05_Confirm_Item_in_AOS:
            - itemName: '${itemName}'
            - START: '${START}'
        navigate:
          - FAILURE: End_time
          - SUCCESS: SUCCESS
    - End_time:
        do:
          io.cloudslang.base.python.python_script:
            - script: |-
                import calendar,time
                print(calendar.timegm(time.gmtime()))
        publish:
          - END: '${return_result.strip()}'
        navigate:
          - SUCCESS: Elapsed_time
          - FAILURE: on_failure
    - Elapsed_time:
        do:
          io.cloudslang.base.math.subtract_numbers:
            - value1: '${END}'
            - value2: '${START}'
        publish:
          - ELAPSED: '${result}'
        navigate:
          - SUCCESS: FAILURE
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
      01_Call_Notepad:
        x: 63
        'y': 262
      02_Call_SAP:
        x: 236
        'y': 219
      03_Call_Rumba:
        x: 402
        'y': 172
      04_Add_Item_in_AOS_Catalog:
        x: 573
        'y': 212
      05_Confirm_Item_in_AOS:
        x: 736
        'y': 263
        navigate:
          982b553b-2aff-7592-308e-7b44fdbc14a2:
            targetId: 73a3a3f9-2fa2-9dab-6eab-03b2a5955ecb
            port: SUCCESS
      End_time:
        x: 407
        'y': 401
      Elapsed_time:
        x: 407
        'y': 572
        navigate:
          180f4b02-c710-3c21-2b7d-50eaa53f7ad7:
            targetId: 4331fc2e-30b3-065f-bf6d-e25f891f3934
            port: SUCCESS
    results:
      FAILURE:
        4331fc2e-30b3-065f-bf6d-e25f891f3934:
          x: 579
          'y': 574
      SUCCESS:
        73a3a3f9-2fa2-9dab-6eab-03b2a5955ecb:
          x: 737
          'y': 442
