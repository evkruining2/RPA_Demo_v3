namespace: RPA_Demo.Tools.Mail_Tools
flow:
  name: Send_Mail
  inputs:
    - Message_Body
    - Mailto
    - Mailfrom
    - MailServer
  workflow:
    - send_mail:
        do:
          io.cloudslang.base.mail.send_mail:
            - hostname: '${MailServer}'
            - port: '25'
            - from: '${Mailfrom}'
            - to: '${Mailto}'
            - subject: Message from RPA
            - body: '${Message_Body}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      send_mail:
        x: 188
        'y': 155
        navigate:
          703795b2-b5bc-3392-4c9d-aedc3d450973:
            targetId: 6fdd9aea-b82e-1f65-3b58-0a5d0b419281
            port: SUCCESS
    results:
      SUCCESS:
        6fdd9aea-b82e-1f65-3b58-0a5d0b419281:
          x: 376
          'y': 128
