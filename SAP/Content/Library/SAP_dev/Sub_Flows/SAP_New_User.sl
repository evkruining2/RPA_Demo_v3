namespace: SAP_dev.Sub_Flows
operation:
  name: SAP_New_User
  inputs:
    - UID
    - firstName
    - lastName
    - email
  sequential_action:
    gav: 'com.microfocus.seq:SAP_dev.Sub_Flows.SAP_New_User:1.0.0'
    skills:
      - Java
      - SAP
      - SAP NWBC Desktop
      - SAPUI5
      - SAPWDJ
      - SAPWebExt
      - Terminal Emulators
      - UI Automation
      - Web
    settings:
      sap:
        server: SAP
        ignore_existing_sessions: false
        active: true
        auto_log_on: true
        user: admin
        client: '001'
        remember_password: false
        close_on_exit: true
        language: EN
        password: Cloud123
      windows:
        active: false
      terminal_settings:
        active: false
      web:
        active: false
        address: 'http://aos.example.com:8080'
        browser: CHROME
        close_on_exit: false
    steps:
      - step:
          id: '1'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
          action: Resize
          default_args: '103,16'
      - step:
          id: '2'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")'
          action: Set
          default_args: '"su01"'
          snapshot: ".\\Snapshots\\ssf1.png"
          highlight_id: '21'
      - step:
          id: '3'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
          action: SendKey
          default_args: ENTER
          snapshot: ".\\Snapshots\\ssf1.png"
          highlight_id: '0'
      - step:
          id: '4'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("User Maintenance: Initial").SAPGuiEdit("User")'
          action: Set
          default_args: '"steve6"'
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '32'
          args: 'Parameter("UID")'
      - step:
          id: '5'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("User Maintenance: Initial").SAPGuiButton("Create   (F8)")'
          action: Click
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '29'
      - step:
          id: '6'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiEdit("Last name")'
          action: Set
          default_args: '"kornakie"'
          snapshot: ".\\Snapshots\\ssf3.png"
          highlight_id: '-1'
          args: 'Parameter("lastName")'
      - step:
          id: '7'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiEdit("First name")'
          action: Set
          default_args: '"steve"'
          snapshot: ".\\Snapshots\\ssf3.png"
          highlight_id: '-1'
          args: 'Parameter("firstName")'
      - step:
          id: '8'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiEdit("E-Mail Address")'
          action: Set
          default_args: '"steve6@example.com"'
          snapshot: ".\\Snapshots\\ssf3.png"
          highlight_id: '44'
          args: 'Parameter("email")'
      - step:
          id: '9'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiEdit("E-Mail Address")'
          action: SetFocus
          snapshot: ".\\Snapshots\\ssf3.png"
          highlight_id: '44'
      - step:
          id: '10'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiTabStrip("TABSTRIP1")'
          action: Select
          default_args: '"Logon Data"'
          snapshot: ".\\Snapshots\\ssf3.png"
          highlight_id: '26'
      - step:
          id: '11'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiEdit("New Password")'
          action: Set
          default_args: '"********"'
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '38'
          args: '"Appl1ance"'
      - step:
          id: '12'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiEdit("Repeat Password")'
          action: Set
          default_args: '"********"'
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '39'
          args: '"Appl1ance"'
      - step:
          id: '13'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiEdit("Repeat Password")'
          action: SetFocus
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '39'
      - step:
          id: '14'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Maintain Users").SAPGuiButton("Save   (Ctrl+S)")'
          action: Click
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '6'
      - step:
          id: '15'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("User Maintenance: Initial").SAPGuiStatusBar("StatusBar")'
          action: Sync
          snapshot: ".\\Snapshots\\ssf5.png"
          highlight_id: '1'
      - step:
          id: '16'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("User Maintenance: Initial")'
          action: Close
          snapshot: ".\\Snapshots\\ssf6.png"
          highlight_id: '0'
      - step:
          id: '17'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("Log Off").SAPGuiButton("Yes")'
          action: Click
          snapshot: ".\\Snapshots\\ssf7.png"
          highlight_id: '3'
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification: ''
        name: Session
        child_objects:
          - object:
              smart_identification: ''
              name: 'User Maintenance: Initial'
              child_objects:
                - object:
                    smart_identification: ''
                    name: StatusBar
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiStatusBar
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '103'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/sbar'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiStatusBar
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: User
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SUID_ST_BNAME-BNAME
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '32'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/ctxtSUID_ST_BNAME-BNAME'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Create   (F8)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[8]'
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '40'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/tbar[1]/btn[8]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SU01
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '1050'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSUID_MAINTENANCE
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Monday, 18 November 2019 21:11:36'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: SAP Easy Access
              child_objects:
                - object:
                    smart_identification: ''
                    name: OKCode
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SAPGuiOKCode
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '35'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/tbar[0]/okcd'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiOKCode
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SESSION_MANAGER
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '100'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSMTR_NAVIGATION
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Monday, 18 November 2019 21:11:36'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Maintain Users
              child_objects:
                - object:
                    smart_identification: ''
                    name: TABSTRIP1
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: TABSTRIP1
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiTabStrip
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '90'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTABSTRIP1'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiTabStrip
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Repeat Password
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SUID_ST_NODE_PASSWORD_EXT-PASSWORD2
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '33'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTABSTRIP1/tabpLOGO/ssubMAINAREA:SAPLSUID_MAINTENANCE:1101/pwdSUID_ST_NODE_PASSWORD_EXT-PASSWORD2'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: New Password
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SUID_ST_NODE_PASSWORD_EXT-PASSWORD
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '33'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTABSTRIP1/tabpLOGO/ssubMAINAREA:SAPLSUID_MAINTENANCE:1101/pwdSUID_ST_NODE_PASSWORD_EXT-PASSWORD'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Last name
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SUID_ST_NODE_PERSON_NAME-NAME_LAST
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '31'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTABSTRIP1/tabpADDR/ssubMAINAREA:SAPLSUID_MAINTENANCE:1900/txtSUID_ST_NODE_PERSON_NAME-NAME_LAST'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: First name
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SUID_ST_NODE_PERSON_NAME-NAME_FIRST
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '31'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTABSTRIP1/tabpADDR/ssubMAINAREA:SAPLSUID_MAINTENANCE:1900/txtSUID_ST_NODE_PERSON_NAME-NAME_FIRST'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: E-Mail Address
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SUID_ST_NODE_COMM_DATA-SMTP_ADDR
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '31'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/tabsTABSTRIP1/tabpADDR/ssubMAINAREA:SAPLSUID_MAINTENANCE:1900/txtSUID_ST_NODE_COMM_DATA-SMTP_ADDR'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiEdit
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Save   (Ctrl+S)
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: 'btn[11]'
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '40'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/tbar[0]/btn[11]'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SU01
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '1100'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSUID_MAINTENANCE
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '21'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[0]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Monday, 18 November 2019 21:11:36'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Log Off
              child_objects:
                - object:
                    smart_identification: ''
                    name: 'Yes'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: SPOP-OPTION1
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '40'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[1]/usr/btnSPOP-OPTION1'
                            regular_expression: false
                          name: compidstr
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: SAPGuiButton
                    visual_relations: ''
                    last_update_time: 'Monday, 18 November 2019 21:11:36'
                    basic_identification:
                      property_ref:
                        - name
                        - micclass
                        - guicomponenttype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: SU01
                      regular_expression: false
                    name: transaction
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '100'
                      regular_expression: false
                    name: screennumber
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: SAPLSPO1
                      regular_expression: false
                    name: program
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'wnd[1]'
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SAPGuiWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '0'
                      regular_expression: false
                    name: hightlight id
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: '22'
                      regular_expression: false
                    name: guicomponenttype
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: 'wnd[1]'
                      regular_expression: false
                    name: compidstr
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: SAPGuiWindow
              visual_relations: ''
              last_update_time: 'Monday, 18 November 2019 21:11:36'
              basic_identification:
                property_ref:
                  - transaction
                  - screennumber
                  - program
                  - name
                  - micclass
                  - guicomponenttype
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: 'ses[0]'
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiSession
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '12'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: '/app/con[0]/ses[0]'
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
        comments: ''
        custom_replay: ''
        class: SAPGuiSession
        visual_relations: ''
        last_update_time: 'Monday, 18 November 2019 21:11:36'
        basic_identification:
          property_ref:
            - name
            - micclass
            - guicomponenttype
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
