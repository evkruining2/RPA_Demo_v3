namespace: RPA_Demo.Testing
flow:
  name: 02_Test
  workflow:
    - 02_Run_Report_Phase_2:
        do:
          RPA_Demo.Sub_flows.02_Run_Report_Phase_2:
            - SAPcode: '1040'
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
      02_Run_Report_Phase_2:
        x: 208
        'y': 143
        navigate:
          b75d30ca-e9da-fa0b-c3cd-c87c0d1995e0:
            targetId: 0325cb45-383d-e189-5e86-16c6e191baa6
            port: SUCCESS
          c096c705-06fc-b813-2c6c-90646ca28b80:
            targetId: 0325cb45-383d-e189-5e86-16c6e191baa6
            port: WARNING
    results:
      SUCCESS:
        0325cb45-383d-e189-5e86-16c6e191baa6:
          x: 423
          'y': 228
