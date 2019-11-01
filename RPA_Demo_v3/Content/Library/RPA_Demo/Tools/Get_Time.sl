namespace: RPA_Demo.Tools
flow:
  name: Get_Time
  workflow:
    - get_time:
        do:
          io.cloudslang.base.datetime.get_time:
            - timezone: CET
        publish:
          - output
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - Current_Time: '${output}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_time:
        x: 156
        'y': 168
        navigate:
          0b7f575f-41cb-6a51-bd2d-33c0c13f14e7:
            targetId: f046ff41-bbd2-9b7f-e5ee-adc25b60600e
            port: SUCCESS
    results:
      SUCCESS:
        f046ff41-bbd2-9b7f-e5ee-adc25b60600e:
          x: 353
          'y': 198
