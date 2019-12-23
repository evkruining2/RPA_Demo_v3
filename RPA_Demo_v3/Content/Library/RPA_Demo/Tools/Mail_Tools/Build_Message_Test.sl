namespace: RPA_Demo.Tools.Mail_Tools
flow:
  name: Build_Message_Test
  inputs:
    - Mailto: erwin@example.com
    - Mailfrom: rpa@example.com
    - Mailserver: mail.example.com
  workflow:
    - get_time:
        do:
          io.cloudslang.base.datetime.get_time: []
        publish:
          - TIME1: '${output}'
        navigate:
          - SUCCESS: Set_Mail_Header
          - FAILURE: on_failure
    - get_time_1:
        do:
          io.cloudslang.base.datetime.get_time: []
        publish:
          - TIME2: '${output}'
        navigate:
          - SUCCESS: Append_Message_Body_1
          - FAILURE: on_failure
    - Append_Message_Body:
        do:
          RPA_Demo.Tools.Mail_Tools.Append_Message_Body:
            - Message_Header: '${Message_Body}'
            - Message_Append: "${'<p>First time stamp is: ' +TIME1}"
        publish:
          - Message_Body
        navigate:
          - SUCCESS: get_time_1
    - Append_Message_Body_1:
        do:
          RPA_Demo.Tools.Mail_Tools.Append_Message_Body:
            - Message_Header: '${Message_Body}'
            - Message_Append: "${'<p>Second times stamp is: ' +TIME2}"
        publish:
          - Message_Body
        navigate:
          - SUCCESS: Set_Mail_Footer
    - Set_Mail_Header:
        do:
          RPA_Demo.Tools.Mail_Tools.Set_Mail_Header: []
        publish:
          - Message_Body
        navigate:
          - SUCCESS: Append_Message_Body
    - Set_Mail_Footer:
        do:
          RPA_Demo.Tools.Mail_Tools.Set_Mail_Footer:
            - Message_Header: '${Message_Body}'
        publish:
          - Message_Body
        navigate:
          - SUCCESS: Send_Mail
    - Send_Mail:
        do:
          RPA_Demo.Tools.Mail_Tools.Send_Mail:
            - Message_Body: '${Message_Body}'
            - Mailto: '${Mailto}'
            - Mailfrom: '${Mailfrom}'
            - MailServer: '${Mailserver}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_time:
        x: 126
        'y': 101
      get_time_1:
        x: 318
        'y': 105
      Append_Message_Body:
        x: 320
        'y': 253
      Append_Message_Body_1:
        x: 503
        'y': 108
      Set_Mail_Header:
        x: 115
        'y': 268
      Set_Mail_Footer:
        x: 505
        'y': 274
      Send_Mail:
        x: 686
        'y': 268
        navigate:
          5176b38f-11f1-86ee-3be7-45bd81b64464:
            targetId: 5c007d30-be13-c699-0add-d43fd0eaa263
            port: SUCCESS
    results:
      SUCCESS:
        5c007d30-be13-c699-0add-d43fd0eaa263:
          x: 692
          'y': 117
