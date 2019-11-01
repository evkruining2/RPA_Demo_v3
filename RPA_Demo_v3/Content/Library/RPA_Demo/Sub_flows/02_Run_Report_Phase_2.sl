namespace: RPA_Demo.Sub_flows
operation:
  name: 02_Run_Report_Phase_2
  inputs:
    - SAPcode
  sequential_action:
    gav: 'com.microfocus.seq:RPA_Demo.Sub_flows.02_Run_Report_Phase_2:1.0.0'
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
        active: false
        apps:
          app_1:
            args: ''
            directory: ''
            path: "C:\\Windows\\System32\\notepad.exe"
      terminal_settings:
        active: false
      web:
        active: false
        address: ''
        close_on_exit: false
    steps:
      - step:
          id: '1'
          object_path: 'Window("Notepad")'
          action: Activate
          snapshot: ".\\Snapshots\\ssf1.png"
          highlight_id: '1639872'
      - step:
          id: '2'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"-"'
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '1967590'
          args: '"---------------------------------------------------------------------------------"'
      - step:
          id: '8'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf8.png"
          highlight_id: '1967590'
      - step:
          id: '11'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"s"'
          snapshot: ".\\Snapshots\\ssf10.png"
          highlight_id: '1967590'
          args: '"Successfully connected to the SAP system and retrieved this SAP banking code:"'
      - step:
          id: '28'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf27.png"
          highlight_id: '1967590'
      - step:
          id: '30'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf29.png"
          highlight_id: '1967590'
          args: 'Parameter("SAPcode")'
      - step:
          id: '32'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf31.png"
          highlight_id: '1967590'
      - step:
          id: '34'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"-"'
          snapshot: ".\\Snapshots\\ssf33.png"
          highlight_id: '1967590'
          args: '"---------------------------------------------------------------------------------"'
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
        name: Notepad
        child_objects:
          - object:
              smart_identification: ''
              name: Edit
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
              comments: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              class: WinEditor
              visual_relations: ''
              last_update_time: 'Friday, November 1, 2019 1:19:43 PM'
              basic_identification:
                property_ref:
                  - nativeclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Notepad
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Notepad
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
            value: Notepad
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'Friday, November 1, 2019 1:19:43 PM'
        basic_identification:
          property_ref:
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
