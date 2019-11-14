namespace: RPA_Demo.Sub_flows
flow:
  name: Process_Flow_Light
  inputs:
    - itemName
    - itemNumber
    - itemDesc
    - itemPrice
    - sleepTimer: '1'
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
            - sleepTimer: '${sleepTimer}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: 04_Add_Item_in_AOS_Catalog
    - 04_Add_Item_in_AOS_Catalog:
        do:
          RPA_Demo.Sub_flows.04_Add_Item_in_AOS_Catalog:
            - itemName: '${itemName}'
            - itemNumber: '${itemNumber}'
            - itemDesc: '${itemDesc}'
            - itemPrice: '${itemPrice}'
            - sleepTimer: '${sleepTimer}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: 05_Confirm_Item_in_AOS
    - 05_Confirm_Item_in_AOS:
        do:
          RPA_Demo.Sub_flows.05_Confirm_Item_in_AOS:
            - itemName: '${itemName}'
            - START: '${START}'
            - sleepTimer: '${sleepTimer}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Set_Start_Time:
        x: 47
        'y': 84
      01_Call_Notepad:
        x: 85
        'y': 246
      04_Add_Item_in_AOS_Catalog:
        x: 262
        'y': 193
      05_Confirm_Item_in_AOS:
        x: 444
        'y': 216
        navigate:
          5d61b168-fccd-1c87-d6b7-b1a109bec8ce:
            targetId: a614619d-cbd7-8c5e-cd34-8885d6f4de5e
            port: SUCCESS
    results:
      SUCCESS:
        a614619d-cbd7-8c5e-cd34-8885d6f4de5e:
          x: 608
          'y': 258
