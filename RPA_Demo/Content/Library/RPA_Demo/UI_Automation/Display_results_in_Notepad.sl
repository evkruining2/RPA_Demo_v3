namespace: RPA_Demo.UI_Automation
operation:
  name: Display_results_in_Notepad
  inputs:
  - name
  - ssn
  sequential_action:
    gav: com.microfocus.seq:RPA_Demo.UI_Automation.Display_results_in_Notepad:1.0.0
    skills:
    - Java
    - SAP NWBC Desktop
    - SAP
    - SAPUI5
    - SAPWDJ
    - SAPWebExt
    - Terminal Emulators
    - UI Automation
    - Web
    - WPF
    settings:
      sap:
        active: false
        auto_log_on: false
        close_on_exit: false
        ignore_existing_sessions: false
        remember_password: false
      windows:
        active: true
        apps:
          app_1:
            args: ''
            directory: ''
            include_child_processes: true
            launch_application: true
            path: c:\windows\notepad.exe
      terminal_settings:
        active: false
      web:
        active: false
        address: ''
        browser: IE64
        close_on_exit: false
    steps:
    - step:
        id: '1'
        object_path: Window("Notepad").WinEditor("Edit")
        action: SetCaretPos
        args: 0,0
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '984272'
    - step:
        id: '2'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"Hello and welcome ro"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '984272'
    - step:
        id: '3'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf3.png
        highlight_id: '984272'
    - step:
        id: '4'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '984272'
    - step:
        id: '5'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"to Micro Focus RPA!!"'
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '984272'
    - step:
        id: '6'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '984272'
    - step:
        id: '7'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '984272'
    - step:
        id: '8'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"We have done some work for you "'
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '984272'
    - step:
        id: '9'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"and this "'
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '984272'
    - step:
        id: '10'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf10.png
        highlight_id: '984272'
    - step:
        id: '11'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '984272'
    - step:
        id: '12'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf12.png
        highlight_id: '984272'
    - step:
        id: '13'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"ese are the results:"'
        snapshot: .\Snapshots\ssf13.png
        highlight_id: '984272'
    - step:
        id: '14'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf14.png
        highlight_id: '984272'
    - step:
        id: '15'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf15.png
        highlight_id: '984272'
    - step:
        id: '16'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"The SSN of "'
        snapshot: .\Snapshots\ssf16.png
        highlight_id: '984272'
    - step:
        id: '17'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf17.png
        highlight_id: '984272'
    - step:
        id: '18'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf18.png
        highlight_id: '984272'
    - step:
        id: '19'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf19.png
        highlight_id: '984272'
    - step:
        id: '20'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf20.png
        highlight_id: '984272'
    - step:
        id: '21'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf21.png
        highlight_id: '984272'
    - step:
        id: '22'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf22.png
        highlight_id: '984272'
    - step:
        id: '23'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf23.png
        highlight_id: '984272'
    - step:
        id: '24'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"user we looked up is xxxx"'
        snapshot: .\Snapshots\ssf24.png
        highlight_id: '984272'
    - step:
        id: '25'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf25.png
        highlight_id: '984272'
    - step:
        id: '26'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf26.png
        highlight_id: '984272'
    - step:
        id: '27'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf27.png
        highlight_id: '984272'
    - step:
        id: '28'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf28.png
        highlight_id: '984272'
    - step:
        id: '29'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf29.png
        highlight_id: '984272'
    - step:
        id: '30'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '":"'
        snapshot: .\Snapshots\ssf30.png
        highlight_id: '984272'
    - step:
        id: '31'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf31.png
        highlight_id: '984272'
    - step:
        id: '32'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf32.png
        highlight_id: '984272'
    - step:
        id: '33'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: Parameter("name")
        snapshot: .\Snapshots\ssf33.png
        highlight_id: '984272'
    - step:
        id: '34'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf34.png
        highlight_id: '984272'
    - step:
        id: '35'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf35.png
        highlight_id: '984272'
    - step:
        id: '36'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"The SSN for thi "'
        snapshot: .\Snapshots\ssf36.png
        highlight_id: '984272'
    - step:
        id: '37'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micBack
        snapshot: .\Snapshots\ssf37.png
        highlight_id: '984272'
    - step:
        id: '38'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"s user is:"'
        snapshot: .\Snapshots\ssf38.png
        highlight_id: '984272'
    - step:
        id: '39'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf39.png
        highlight_id: '984272'
    - step:
        id: '40'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf40.png
        highlight_id: '984272'
    - step:
        id: '41'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf41.png
        highlight_id: '984272'
    - step:
        id: '42'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: Parameter("ssn")
        snapshot: .\Snapshots\ssf42.png
        highlight_id: '984272'
    - step:
        id: '43'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf43.png
        highlight_id: '984272'
    - step:
        id: '44'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf44.png
        highlight_id: '984272'
    - step:
        id: '45'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: micReturn
        snapshot: .\Snapshots\ssf45.png
        highlight_id: '984272'
    - step:
        id: '46'
        object_path: Window("Notepad").WinEditor("Edit")
        action: Type
        args: '"That''s it. Have a nice day!"'
        snapshot: .\Snapshots\ssf46.png
        highlight_id: '984272'
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Window
      name: Notepad
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
          value: Notepad
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, March 23, 2021 4:30:36 PM
      child_objects:
      - object:
          class: WinEditor
          name: Edit
          properties:
          - property:
              value:
                value: Edit
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - nativeclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: Edit
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Tuesday, March 23, 2021 4:30:36 PM
          child_objects: []
  check_points_and_outputs: []
  parameters: []
