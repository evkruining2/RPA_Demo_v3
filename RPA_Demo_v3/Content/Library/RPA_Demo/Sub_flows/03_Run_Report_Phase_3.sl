namespace: RPA_Demo.Sub_flows
operation:
  name: 03_Run_Report_Phase_3
  inputs:
    - MFmessage
  sequential_action:
    gav: 'com.microfocus.seq:RPA_Demo.Sub_flows.03_Run_Report_Phase_3:1.0.0'
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
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '1967590'
      - step:
          id: '4'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '1967590'
      - step:
          id: '7'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf7.png"
          highlight_id: '1967590'
      - step:
          id: '9'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"-"'
          snapshot: ".\\Snapshots\\ssf9.png"
          highlight_id: '1967590'
          args: '"---------------------------------------------------------------------------------"'
      - step:
          id: '11'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf11.png"
          highlight_id: '1967590'
      - step:
          id: '13'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"s"'
          snapshot: ".\\Snapshots\\ssf13.png"
          highlight_id: '1967590'
          args: '"Successfully create a new account in CICS"'
      - step:
          id: '15'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf15.png"
          highlight_id: '1967590'
      - step:
          id: '17'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"-"'
          snapshot: ".\\Snapshots\\ssf17.png"
          highlight_id: '1967590'
          args: 'Parameter("MFmessage")'
      - step:
          id: '19'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf19.png"
          highlight_id: '1967590'
      - step:
          id: '21'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf21.png"
          highlight_id: '1967590'
          args: '"---------------------------------------------------------------------------------"'
      - step:
          id: '23'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf23.png"
          highlight_id: '1967590'
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
              last_update_time: 'Friday, November 1, 2019 1:30:26 PM'
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
        last_update_time: 'Friday, November 1, 2019 1:30:26 PM'
        basic_identification:
          property_ref:
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
