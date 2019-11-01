namespace: RPA_Demo.Sub_flows
flow:
  name: 04_Add_Item_in_AOS_Catalog
  inputs:
    - itemName
    - itemNumber
    - itemDesc
    - itemPrice
  workflow:
    - Add_item_to_AOS_catalog:
        do:
          Demo_v2.Sub_Flows.Add_item_to_AOS_catalog:
            - itemName: '${itemName}'
            - itemNumber: '${itemNumber}'
            - itemDesc: '${itemDesc}'
            - itemPrice: '${itemPrice}'
        publish:
          - status_code
          - return_result
          - itemName
        navigate:
          - SUCCESS: 04_Run_Report_Phase_4
          - FAILURE: on_failure
    - sleep:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '5'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - 04_Run_Report_Phase_4:
        do:
          RPA_Demo.Sub_flows.04_Run_Report_Phase_4:
            - itemDesc: '${itemDesc}'
        navigate:
          - SUCCESS: sleep
          - WARNING: sleep
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Add_item_to_AOS_catalog:
        x: 69
        'y': 80
      04_Run_Report_Phase_4:
        x: 264
        'y': 87
      sleep:
        x: 434
        'y': 82
        navigate:
          18a272a2-9c7a-e36a-023f-89c8916f2c3c:
            targetId: d42b5b36-4522-4e47-9cae-5b653f947c4b
            port: SUCCESS
    results:
      SUCCESS:
        d42b5b36-4522-4e47-9cae-5b653f947c4b:
          x: 612
          'y': 74
