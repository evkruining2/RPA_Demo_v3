namespace: RPA_Demo.Testing
flow:
  name: 04_test
  workflow:
    - 04_Run_Report_Phase_4:
        do:
          RPA_Demo.Sub_flows.04_Run_Report_Phase_4:
            - itemDesc: HP Elitebook Pro withstuff
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
      04_Run_Report_Phase_4:
        x: 309
        'y': 232
        navigate:
          9a31edc6-deb9-204c-984c-f1fee7b29346:
            targetId: caf407fd-a158-b817-cd0d-5224210eab16
            port: SUCCESS
          2fbfb895-8e29-fa4d-9913-cf1db8619c7e:
            targetId: caf407fd-a158-b817-cd0d-5224210eab16
            port: WARNING
    results:
      SUCCESS:
        caf407fd-a158-b817-cd0d-5224210eab16:
          x: 557
          'y': 355
