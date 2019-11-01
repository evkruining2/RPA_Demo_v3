namespace: RPA_Demo.Testing
flow:
  name: 03_test
  workflow:
    - 03_Run_Report_Phase_3:
        do:
          RPA_Demo.Sub_flows.03_Run_Report_Phase_3:
            - MFmessage: 'ACCT created!'
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
      03_Run_Report_Phase_3:
        x: 195
        'y': 228
        navigate:
          90079097-8428-c4f9-4b55-74d0047f261a:
            targetId: 89f62dba-7158-a2f2-ede8-ae9edb5e1eca
            port: SUCCESS
          c633b231-c9e3-88a0-1a33-e2076ac2e3bb:
            targetId: 89f62dba-7158-a2f2-ede8-ae9edb5e1eca
            port: WARNING
    results:
      SUCCESS:
        89f62dba-7158-a2f2-ede8-ae9edb5e1eca:
          x: 407
          'y': 416
