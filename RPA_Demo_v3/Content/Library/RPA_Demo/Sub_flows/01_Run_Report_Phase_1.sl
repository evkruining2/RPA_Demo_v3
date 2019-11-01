namespace: RPA_Demo.Sub_flows
operation:
  name: 01_Run_Report_Phase_1
  inputs:
    - Current_Time
    - itemName
    - itemNumber
    - itemDesc
    - itemPrice
  sequential_action:
    gav: 'com.microfocus.seq:RPA_Demo.Sub_flows.01_Run_Report_Phase_1:1.0.0'
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
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: SetCaretPos
          default_args: '0,0'
          snapshot: ".\\Snapshots\\ssf1.png"
          highlight_id: '656786'
      - step:
          id: '2'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"Hello and welcome to RPA!"'
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '656786'
      - step:
          id: '3'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf3.png"
          highlight_id: '656786'
      - step:
          id: '4'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '656786'
      - step:
          id: '5'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"A new flow has been started. "'
          snapshot: ".\\Snapshots\\ssf5.png"
          highlight_id: '656786'
      - step:
          id: '6'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"The start time was: +"'
          snapshot: ".\\Snapshots\\ssf6.png"
          highlight_id: '656786'
          args: '"The flow was started on: "'
      - step:
          id: '7'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf7.png"
          highlight_id: '656786'
          args: 'Parameter("Current_Time")'
      - step:
          id: '8'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf8.png"
          highlight_id: '656786'
      - step:
          id: '20'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"is item will be added to the "'
          snapshot: ".\\Snapshots\\ssf20.png"
          highlight_id: '656786'
          args: '"This item will be added to the AOS online sore: "'
      - step:
          id: '22'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf22.png"
          highlight_id: '656786'
      - step:
          id: '23'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf23.png"
          highlight_id: '656786'
      - step:
          id: '24'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"item Name: +"'
          snapshot: ".\\Snapshots\\ssf24.png"
          highlight_id: '656786'
          args: 'Parameter("itemName")'
      - step:
          id: '25'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf25.png"
          highlight_id: '656786'
      - step:
          id: '26'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"item Description: +"'
          snapshot: ".\\Snapshots\\ssf26.png"
          highlight_id: '656786'
          args: 'Parameter("itemDesc")'
      - step:
          id: '27'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf27.png"
          highlight_id: '656786'
      - step:
          id: '28'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"item Price; +"'
          snapshot: ".\\Snapshots\\ssf28.png"
          highlight_id: '656786'
          args: 'Parameter("itemPrice")'
      - step:
          id: '32'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf32.png"
          highlight_id: '656786'
      - step:
          id: '34'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: '"item Number: +"'
          snapshot: ".\\Snapshots\\ssf34.png"
          highlight_id: '656786'
          args: 'Parameter("itemNumber")'
      - step:
          id: '35'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf35.png"
          highlight_id: '656786'
      - step:
          id: '36'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf36.png"
          highlight_id: '656786'
      - step:
          id: '37'
          object_path: 'Window("Notepad").WinEditor("Edit")'
          action: Type
          default_args: micReturn
          snapshot: ".\\Snapshots\\ssf37.png"
          highlight_id: '656786'
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
              last_update_time: 'Friday, November 1, 2019 12:44:19 PM'
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
        last_update_time: 'Friday, November 1, 2019 12:44:19 PM'
        basic_identification:
          property_ref:
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
