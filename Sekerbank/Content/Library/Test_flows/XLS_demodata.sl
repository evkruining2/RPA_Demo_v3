namespace: Test_flows
operation:
  name: XLS_demodata
  sequential_action:
    gav: 'com.microfocus.seq:Test_flows.XLS_demodata:1.0.0'
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
        server: ''
        ignore_existing_sessions: false
        active: false
        auto_log_on: false
        user: ''
        client: ''
        remember_password: false
        close_on_exit: false
        language: ''
        password: ''
      windows:
        active: true
        apps:
          app_1:
            args: ''
            directory: "c:\\demo"
            path: "C:\\Program Files (x86)\\Microsoft Office\\root\\Office16\\excel.exe"
      terminal_settings:
        active: false
      web:
        active: false
        address: 'http://localhost:8080'
        browser: CHROME
        close_on_exit: false
    steps:
      - step:
          id: '1'
          object_path: 'Window("Excel").WinObject("WinObject").WinList("File")'
          action: Select
          default_args: '"Open"'
          snapshot: ".\\Snapshots\\ssf1.png"
          highlight_id: '2060288184'
      - step:
          id: '2'
          object_path: 'Window("Excel").WinObject("WinObject").WinButton("Browse")'
          action: Click
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '2062175936'
      - step:
          id: '4'
          object_path: 'Dialog("Open").WinEdit("File name:")'
          action: Set
          default_args: "\"c:\\users\\administrator\\documents\\demodata.xlsx\""
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '3671092'
      - step:
          id: '5'
          object_path: 'Dialog("Open").WinEdit("File name:")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf5.png"
          highlight_id: '3671092'
      - step:
          id: '16'
          action: Wait
          default_args: '"1"'
          args: '"3"'
      - step:
          id: '6'
          object_path: 'Window("Excel").WinObject("demodata")'
          action: Click
          default_args: '135,70'
          snapshot: ".\\Snapshots\\ssf6.png"
          highlight_id: '3147280'
      - step:
          id: '7'
          object_path: 'Window("Excel").WinObject("demodata")'
          action: Drag
          default_args: '21,31'
          snapshot: ".\\Snapshots\\ssf7.png"
          highlight_id: '3147280'
      - step:
          id: '8'
          object_path: 'Window("Excel").WinObject("demodata")'
          action: Drop
          default_args: '14,67'
          snapshot: ".\\Snapshots\\ssf8.png"
          highlight_id: '3147280'
      - step:
          id: '9'
          object_path: 'Window("Excel").WinObject("Ribbon").WinButton("Delete")'
          action: Click
          snapshot: ".\\Snapshots\\ssf9.png"
          highlight_id: '2062176488'
      - step:
          id: '10'
          object_path: 'Window("Excel").WinObject("Ribbon").WinMenu("WinMenu")'
          action: Select
          default_args: '"Delete Sheet Rows"'
      - step:
          id: '11'
          object_path: 'Window("Excel").WinObject("demodata")'
          action: Click
          default_args: '69,13'
          snapshot: ".\\Snapshots\\ssf10.png"
          highlight_id: '3147280'
      - step:
          id: '12'
          object_path: 'Window("Excel").WinObject("Ribbon").WinButton("Delete")'
          action: Click
          snapshot: ".\\Snapshots\\ssf11.png"
          highlight_id: '2062176488'
      - step:
          id: '13'
          object_path: 'Window("Excel").WinObject("Ribbon").WinMenu("WinMenu")'
          action: Select
          default_args: '"Delete Sheet Columns"'
      - step:
          id: '14'
          object_path: 'Window("Excel").WinObject("demodata")'
          action: Click
          default_args: '67,31'
          snapshot: ".\\Snapshots\\ssf12.png"
          highlight_id: '3147280'
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
        name: Excel
        child_objects:
          - object:
              smart_identification: ''
              name: WinObject
              child_objects:
                - object:
                    smart_identification: ''
                    name: File
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: list
                            regular_expression: false
                          name: nativeclass
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: attached text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: File
                            regular_expression: false
                          name: acc_name
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay:
                      behavior:
                        value: list
                        name: simclass
                        type: STRING
                    class: WinList
                    visual_relations: ''
                    last_update_time: 'Tuesday, 12 November 2019 16:20:50'
                    basic_identification:
                      property_ref:
                        - nativeclass
                        - attached text
                        - acc_name
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Browse
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: push button
                            regular_expression: false
                          name: nativeclass
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Browse
                            regular_expression: false
                          name: acc_name
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay:
                      behavior:
                        value: push button
                        name: simclass
                        type: STRING
                    class: WinButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 12 November 2019 16:20:50'
                    basic_identification:
                      property_ref:
                        - text
                        - nativeclass
                        - acc_name
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: NetUIHWND
                      regular_expression: false
                    name: regexpwndclass
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: acc_name
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: window
                  name: simclass
                  type: STRING
              class: WinObject
              visual_relations: ''
              last_update_time: 'Tuesday, 12 November 2019 16:20:50'
              basic_identification:
                property_ref:
                  - regexpwndclass
                  - acc_name
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Ribbon
              child_objects:
                - object:
                    smart_identification: ''
                    name: WinMenu
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '11'
                            regular_expression: false
                          name: menuobjtype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WinMenu
                    visual_relations: ''
                    last_update_time: 'Tuesday, 12 November 2019 16:20:50'
                    basic_identification:
                      property_ref:
                        - menuobjtype
                        - acc_name
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Delete
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: drop down button
                            regular_expression: false
                          name: nativeclass
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Delete
                            regular_expression: false
                          name: acc_name
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay:
                      behavior:
                        value: drop down button
                        name: simclass
                        type: STRING
                    class: WinButton
                    visual_relations: ''
                    last_update_time: 'Tuesday, 12 November 2019 16:20:50'
                    basic_identification:
                      property_ref:
                        - text
                        - nativeclass
                        - acc_name
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: NetUIHWND
                      regular_expression: false
                    name: regexpwndclass
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Ribbon
                      regular_expression: false
                    name: acc_name
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: window
                  name: simclass
                  type: STRING
              class: WinObject
              visual_relations: ''
              last_update_time: 'Tuesday, 12 November 2019 16:20:50'
              basic_identification:
                property_ref:
                  - regexpwndclass
                  - acc_name
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: demodata
              child_objects: []
              properties:
                - property:
                    value:
                      value: EXCEL7
                      regular_expression: false
                    name: regexpwndclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: EXCEL7
                  name: simclass
                  type: STRING
              class: WinObject
              visual_relations: ''
              last_update_time: 'Tuesday, 12 November 2019 16:20:50'
              basic_identification:
                property_ref:
                  - regexpwndclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Excel
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: XLMAIN
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: XLMAIN
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'Tuesday, 12 November 2019 16:20:50'
        basic_identification:
          property_ref:
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
    - object:
        smart_identification: ''
        name: Open
        child_objects:
          - object:
              smart_identification: ''
              name: 'File name:'
              child_objects: []
              properties:
                - property:
                    value:
                      value: Edit
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'File &name:'
                      regular_expression: false
                    name: attached text
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              class: WinEdit
              visual_relations: ''
              last_update_time: 'Tuesday, 12 November 2019 16:20:50'
              basic_identification:
                property_ref:
                  - nativeclass
                  - attached text
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Open
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: '#32770'
            name: simclass
            type: STRING
        class: Dialog
        visual_relations: ''
        last_update_time: 'Tuesday, 12 November 2019 16:20:50'
        basic_identification:
          property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
