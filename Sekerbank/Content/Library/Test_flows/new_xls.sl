namespace: Test_flows
operation:
  name: new_xls
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  sequential_action:
    gav: com.microfocus.seq:Test_flows.new_xls:1.0.0
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
        object_path: Window("Excel").WinObject("WinObject").WinList("Recent")
        action: Select
        default_args: '"demodata"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2066017024'
    - step:
        id: '2'
        object_path: Window("Excel").WinObject("XLDESK")
        action: Click
        default_args: 263,255
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '2885624'
    - step:
        id: '3'
        object_path: Window("Excel").WinObject("demodata")
        action: Drag
        default_args: 13,71
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '2164186'
    - step:
        id: '4'
        object_path: Window("Excel").WinObject("demodata")
        action: Drop
        default_args: 24,33
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '2164186'
    - step:
        id: '5'
        object_path: Window("Excel").WinObject("demodata")
        action: Click
        default_args: 9, 30, micRightBtn
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '2164186'
    - step:
        id: '6'
        object_path: Window("Excel").WinObject("WinObject_2").WinObject("WinObject").WinMenu("WinMenu")
        action: Select
        default_args: '"Delete"'
    - step:
        id: '7'
        object_path: Window("Excel").WinObject("demodata")
        action: Click
        default_args: 58,8
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '2164186'
    - step:
        id: '8'
        object_path: Window("Excel").WinObject("demodata")
        action: Click
        default_args: 58, 8, micRightBtn
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '2164186'
    - step:
        id: '9'
        object_path: Window("Excel").WinObject("WinObject_2").WinObject("WinObject").WinMenu("WinMenu")
        action: Select
        default_args: '"Delete"'
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
      last_update_time: Wednesday, 13 November 2019 09:18:35
      child_objects:
      - object:
          class: WinObject
          name: XLDESK
          properties:
          - property:
              value:
                value: XLDESK
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
              value: XLDESK
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Wednesday, 13 November 2019 09:18:35
          child_objects: []
      - object:
          class: WinObject
          name: WinObject_2
          properties:
          - property:
              value:
                value: '0'
                regular_expression: false
              name: window id
              hidden: false
              read_only: false
              type: NUMBER
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
                value: Net UI Tool Window
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: window
                regular_expression: false
              name: object class
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: window
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
                value: ''
                regular_expression: false
              name: acc_name
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - window id
            - text
            - regexpwndclass
            - object class
            - nativeclass
            - attached text
            - acc_name
            ordinal_identifier:
              value: 1
              type: location
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Wednesday, 13 November 2019 09:18:35
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
              last_update_time: Wednesday, 13 November 2019 09:18:35
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
                  last_update_time: Wednesday, 13 November 2019 09:18:35
                  child_objects: []
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
          last_update_time: Wednesday, 13 November 2019 09:18:35
          child_objects:
          - object:
              class: WinList
              name: Recent
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
                    value: Recent
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
              last_update_time: Wednesday, 13 November 2019 09:18:35
              child_objects: []
      - object:
          class: WinObject
          name: demodata
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
          last_update_time: Wednesday, 13 November 2019 09:18:35
          child_objects: []
  check_points_and_outputs: []
  parameters: []
