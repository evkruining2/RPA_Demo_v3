namespace: Test_flows
operation:
  name: XLS_Test
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  sequential_action:
    gav: com.microfocus.seq:Test_flows.XLS_Test:1.0.0
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
        active: false
        auto_log_on: false
        client: ''
        close_on_exit: false
        ignore_existing_sessions: false
        language: ''
        password: ''
        remember_password: false
        server: ''
        user: ''
      windows:
        active: true
        apps:
          app_1:
            args: ''
            directory: c:\demo
            path: C:\Program Files (x86)\Microsoft Office\root\Office16\excel.exe
      terminal_settings:
        active: false
      web:
        active: false
        address: http://localhost:8080
        browser: CHROME
        close_on_exit: false
    steps:
    - step:
        id: '1'
        object_path: Window("Excel").WinObject("WinObject").WinList("File")
        action: Select
        default_args: '"Open"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2061196976'
    - step:
        id: '2'
        object_path: Window("Excel").WinObject("WinObject").WinMenu("WinMenu")
        action: Select
        default_args: '"This PC"'
    - step:
        id: '3'
        object_path: Window("Excel").WinObject("WinObject").WinList("Items")
        action: Select
        default_args: '"test"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2061209296'
    - step:
        id: '4'
        object_path: Window("Excel").WinObject("test")
        action: Click
        default_args: 44,28
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '1968258'
    - step:
        id: '5'
        object_path: Window("Excel").WinObject("test")
        action: Drag
        default_args: 17,29
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '1968258'
    - step:
        id: '6'
        object_path: Window("Excel").WinObject("test")
        action: Drop
        default_args: 11,68
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '1968258'
    - step:
        id: '7'
        object_path: Window("Excel").WinObject("Ribbon").WinButton("Delete")
        action: Click
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '2060677232'
    - step:
        id: '8'
        object_path: Window("Excel").WinObject("Ribbon").WinMenu("WinMenu")
        action: Select
        default_args: '"Delete Sheet Rows"'
    - step:
        id: '9'
        object_path: Window("Excel").WinObject("test")
        action: Click
        default_args: 58,16
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '1968258'
    - step:
        id: '10'
        object_path: Window("Excel").WinObject("Ribbon").WinButton("Delete")
        action: Click
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '2060677232'
    - step:
        id: '11'
        object_path: Window("Excel").WinObject("Ribbon").WinMenu("WinMenu")
        action: Select
        default_args: '"Delete Sheet Columns"'
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Window
      name: Excel
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
      basic_identification:
        property_ref:
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: XLMAIN
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, 12 November 2019 15:42:02
      child_objects:
      - object:
          class: WinObject
          name: WinObject
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
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 12 November 2019 15:42:02
          child_objects:
          - object:
              class: WinMenu
              name: WinMenu
              properties:
              - property:
                  value:
                    value: '2'
                    regular_expression: false
                  name: menuobjtype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: Open
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - menuobjtype
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 12 November 2019 15:42:02
              child_objects: []
          - object:
              class: WinList
              name: Items
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
                    value: Date modified
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Items
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: list
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 12 November 2019 15:42:02
              child_objects: []
          - object:
              class: WinList
              name: File
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
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: list
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 12 November 2019 15:42:02
              child_objects: []
      - object:
          class: WinObject
          name: test
          properties:
          - property:
              value:
                value: EXCEL7
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: EXCEL7
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 12 November 2019 15:42:02
          child_objects: []
      - object:
          class: WinObject
          name: Ribbon
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
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, 12 November 2019 15:42:02
          child_objects:
          - object:
              class: WinMenu
              name: WinMenu
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
              basic_identification:
                property_ref:
                - menuobjtype
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 12 November 2019 15:42:02
              child_objects: []
          - object:
              class: WinButton
              name: Delete
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
              basic_identification:
                property_ref:
                - text
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: drop down button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 12 November 2019 15:42:02
              child_objects: []
  check_points_and_outputs: []
  parameters: []
