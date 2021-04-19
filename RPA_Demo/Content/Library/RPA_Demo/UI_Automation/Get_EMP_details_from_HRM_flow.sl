namespace: RPA_Demo.UI_Automation
flow:
  name: Get_EMP_details_from_HRM_flow
  inputs:
    - name: erwin
  workflow:
    - Get_EMP_details_from_HRM:
        do:
          RPA_Demo.UI_Automation.Get_EMP_details_from_HRM:
            - name: '${name}'
        publish:
          - empID
          - phone
          - job_Title
          - email
        navigate:
          - SUCCESS:
              next_step: SUCCESS
              ROI: '10'
          - WARNING:
              next_step: SUCCESS
              ROI: '5'
          - FAILURE: on_failure
  outputs:
    - Employee_Id: '${empID}'
    - Job_Title: '${job_Title}'
    - Email_Address: '${email}'
    - Phone_Number: '${phone}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Get_EMP_details_from_HRM:
        x: 154
        'y': 170
        navigate:
          f160ed75-e016-f137-b8af-f310f5a33023:
            targetId: 7dbf67af-7083-4298-bc3d-373a6d36a5ad
            port: SUCCESS
          5d4f776b-a706-ef38-f294-7b631c648bb2:
            targetId: 7dbf67af-7083-4298-bc3d-373a6d36a5ad
            port: WARNING
    results:
      SUCCESS:
        7dbf67af-7083-4298-bc3d-373a6d36a5ad:
          x: 335
          'y': 46
