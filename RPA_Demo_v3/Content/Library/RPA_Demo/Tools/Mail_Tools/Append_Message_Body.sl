namespace: RPA_Demo.Tools.Mail_Tools
flow:
  name: Append_Message_Body
  inputs:
    - Message_Header
    - Message_Append
  workflow:
    - append:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: '${Message_Header}'
            - text: '${Message_Append}'
        publish:
          - Message_Body: '${new_string}'
        navigate:
          - SUCCESS: SUCCESS
  outputs:
    - Message_Body: '${Message_Body}'
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      append:
        x: 83
        'y': 99
        navigate:
          1943cf0c-df59-0e51-2d85-d6771653b5e4:
            targetId: 3f05d410-86f6-fcfb-770f-bf0c685a2693
            port: SUCCESS
    results:
      SUCCESS:
        3f05d410-86f6-fcfb-770f-bf0c685a2693:
          x: 265
          'y': 88
