namespace: RPA_Demo.Test
flow:
  name: Test_Check_Store
  workflow:
    - 05_Check_AOS_Store:
        do:
          RPA_Demo.Sub_flows.05_Check_AOS_Store:
            - itemName: 15z l
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
      05_Check_AOS_Store:
        x: 130
        'y': 182
        navigate:
          caf0c21e-5a03-9d68-6697-b51defa8b4f6:
            targetId: 9e9482e1-699a-f75a-8cdb-267b3367a128
            port: SUCCESS
          cb29ccb4-905f-6ef3-ba75-ac6855752652:
            targetId: 9e9482e1-699a-f75a-8cdb-267b3367a128
            port: WARNING
    results:
      SUCCESS:
        9e9482e1-699a-f75a-8cdb-267b3367a128:
          x: 287
          'y': 177
