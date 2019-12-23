namespace: SAP_dev.Main
flow:
  name: New_User_Manual_Input
  inputs:
    - firstName
    - lastName
  workflow:
    - Generate_UID:
        do:
          io.cloudslang.base.python.python_script:
            - script: |-
                import calendar,time
                print(calendar.timegm(time.gmtime()))
        publish:
          - UID: '${return_result.strip()}'
        navigate:
          - SUCCESS: SAP_New_User
          - FAILURE: on_failure
    - SAP_New_User:
        do:
          SAP_dev.Sub_Flows.SAP_New_User:
            - UID: '${UID}'
            - firstName: '${firstName}'
            - lastName: '${lastName}'
            - email: "${UID+'@example.com'}"
        navigate:
          - SUCCESS: Set_Mail_Header
          - WARNING: Set_Mail_Header
          - FAILURE: on_failure
    - Create_AD_User_from_Template:
        do_external:
          b211c14b-f71c-42ce-956f-9b79a1a61a23:
            - host: 10.0.0.204
            - username: administrator
            - password:
                value: admin@123
                sensitive: true
            - First Name: '${firstName}'
            - Last Name: '${lastName}'
            - Clone: TestAccount
            - Line Manager: Line.Manager@domain.com
            - Directorate (Department): 'Resources & Commercial'
            - Expiration: 01/01/2022
            - Job Title: Presenter
        navigate:
          - failure: on_failure
          - success: Append_Message_Body_1
    - Set_Mail_Header:
        do:
          RPA_Demo.Tools.Mail_Tools.Set_Mail_Header: []
        publish:
          - Message_Body
        navigate:
          - SUCCESS: Append_Message_Body
    - Append_Message_Body:
        do:
          RPA_Demo.Tools.Mail_Tools.Append_Message_Body:
            - Message_Header: '${Message_Body}'
            - Message_Append: "${'<p>Succesfully created SAP user with User ID: '+UID}"
        publish:
          - Message_Body
        navigate:
          - SUCCESS: Create_AD_User_from_Template
    - Append_Message_Body_1:
        do:
          RPA_Demo.Tools.Mail_Tools.Append_Message_Body:
            - Message_Header: '${Message_Body}'
            - Message_Append: "${'<p>Succesfully created a new Active Directory entry for user ' +firstName+' '+lastName+'<p>Successfully created a mail account for the user with email address '+UID+'@example.com'}"
        publish:
          - Message_Body
        navigate:
          - SUCCESS: Set_Mail_Footer
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
            - Mailto: erwin@example.com
            - Mailfrom: rpa@example.com
            - MailServer: mail.example.com
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Generate_UID:
        x: 64
        'y': 85
      SAP_New_User:
        x: 62
        'y': 238
      Create_AD_User_from_Template:
        x: 267
        'y': 234
      Set_Mail_Header:
        x: 67
        'y': 388
      Append_Message_Body:
        x: 268
        'y': 392
      Append_Message_Body_1:
        x: 265
        'y': 62
      Set_Mail_Footer:
        x: 450
        'y': 65
      Send_Mail:
        x: 451
        'y': 242
        navigate:
          03511a68-9529-d861-4162-7b502521356c:
            targetId: 9dd01b82-2f4b-a657-86ae-c3ae1f25e760
            port: SUCCESS
    results:
      SUCCESS:
        9dd01b82-2f4b-a657-86ae-c3ae1f25e760:
          x: 451
          'y': 410
