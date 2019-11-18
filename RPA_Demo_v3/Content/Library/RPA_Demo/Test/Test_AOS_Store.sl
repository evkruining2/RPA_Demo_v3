namespace: RPA_Demo.Test
flow:
  name: Test_AOS_Store
  inputs:
    - itemName: 11t
  workflow:
    - 05_Check_AOS_Store:
        do:
          RPA_Demo.Sub_flows.05_Check_AOS_Store:
            - itemName: '${itemName}'
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
        x: 169
        'y': 136
        navigate:
          a1882b42-f89a-4baa-38fb-262029ed9f57:
            targetId: 5526d822-c1b4-1cbe-01a4-798c850d655d
            port: SUCCESS
          207fe554-d65f-bc11-e442-78d0ecea7dc8:
            targetId: 5526d822-c1b4-1cbe-01a4-798c850d655d
            port: WARNING
    results:
      SUCCESS:
        5526d822-c1b4-1cbe-01a4-798c850d655d:
          x: 336
          'y': 137
