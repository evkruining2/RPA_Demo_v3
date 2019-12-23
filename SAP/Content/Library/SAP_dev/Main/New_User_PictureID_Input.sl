namespace: SAP_dev.Main
flow:
  name: New_User_PictureID_Input
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
          - SUCCESS: OCR_Get_ID
          - FAILURE: on_failure
    - OCR_Get_ID:
        do:
          SAP_dev.Sub_Flows.OCR_Get_ID: []
        publish:
          - firstName
          - lastName
        navigate:
          - FAILURE: on_failure
          - SUCCESS: Set_Mail_Header
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
            - Message_Append: "${'<p>Successfully scanned picture ID and found new user: '+firstName+' '+lastName+' with User ID: '+UID}"
        publish:
          - Message_Body
        navigate:
          - SUCCESS: SAP_New_User
    - SAP_New_User:
        do:
          SAP_dev.Sub_Flows.SAP_New_User:
            - UID: '${UID}'
            - firstName: '${firstName}'
            - lastName: '${lastName}'
            - email: "${UID+'@example.com'}"
        navigate:
          - SUCCESS: Append_Message_Body_1
          - WARNING: Append_Message_Body_1
          - FAILURE: on_failure
    - Append_Message_Body_1:
        do:
          RPA_Demo.Tools.Mail_Tools.Append_Message_Body:
            - Message_Header: '${Message_Body}'
            - Message_Append: "${'<p>Successfully created a new user in SAP with user ID: '+UID}"
        publish:
          - Message_Body
        navigate:
          - SUCCESS: Create_AD_User_from_Template
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
            - Job Title: Bean Counter
        navigate:
          - failure: on_failure
          - success: Append_Message_Body_2
    - Append_Message_Body_2:
        do:
          RPA_Demo.Tools.Mail_Tools.Append_Message_Body:
            - Message_Header: '${Message_Body}'
            - Message_Append: '<p>Successfully created the user in Active Directory'
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
      OCR_Get_ID:
        x: 39
        'y': 213
      Set_Mail_Footer:
        x: 563
        'y': 203
      Generate_UID:
        x: 38
        'y': 65
      SAP_New_User:
        x: 203
        'y': 215
      Send_Mail:
        x: 741
        'y': 208
        navigate:
          65272158-3098-4ea3-421a-96482f787810:
            targetId: 91b5c92d-3d98-7520-2083-cc87a8226952
            port: SUCCESS
      Append_Message_Body_1:
        x: 382
        'y': 210
      Append_Message_Body_2:
        x: 566
        'y': 360
      Create_AD_User_from_Template:
        x: 382
        'y': 369
      Set_Mail_Header:
        x: 31
        'y': 367
      Append_Message_Body:
        x: 201
        'y': 365
    results:
      SUCCESS:
        91b5c92d-3d98-7520-2083-cc87a8226952:
          x: 740
          'y': 368
