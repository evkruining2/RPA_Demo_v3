namespace: RPA_Demo.Testing
flow:
  name: 01_test
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
            - itemName: ITEMNAME
            - itemNumber: '343434'
            - itemDesc: this is the description
            - itemPrice: '899'
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
      01_Run_Report_Phase_1:
        x: 298
        'y': 170
        navigate:
          34820207-15bc-0216-46c3-71714fda758c:
            targetId: 74244cfd-9ec2-4be2-8bac-f14849861856
            port: SUCCESS
          f1b6f181-9a64-ff51-2196-2fd5175cd633:
            targetId: 74244cfd-9ec2-4be2-8bac-f14849861856
            port: WARNING
      Get_Time:
        x: 99
        'y': 138
    results:
      SUCCESS:
        74244cfd-9ec2-4be2-8bac-f14849861856:
          x: 460
          'y': 259
