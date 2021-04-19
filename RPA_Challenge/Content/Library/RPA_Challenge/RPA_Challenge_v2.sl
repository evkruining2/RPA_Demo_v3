namespace: RPA_Challenge
operation:
  name: RPA_Challenge_v2
  inputs:
    - Filename
  sequential_action:
    gav: 'com.microfocus.seq:RPA_Challenge.RPA_Challenge_v2:1.3.2'
    skills:
      - SAPWebExt
      - UI Automation
      - Web
      - WPF
    settings:
      windows:
        active: false
      web:
        active: true
        address: 'http://rpachallenge.com/'
        browser: CHROME
        close_on_exit: false
    steps:
      - step:
          id: '1'
          object_path: DataTable
          action: 'Import(Parameter("Filename"))'
      - step:
          id: '3'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebButton("Start")'
          action: Click
      - step:
          id: '4'
          action: Script
          object_path: For i = 1 To 10 Step 1
      - step:
          id: '5'
          object_path: DataTable
          action: SetCurrentRow(i)
      - step:
          id: '6'
          action: Script
          object_path: fn= Datatable.Value(1)
      - step:
          id: '7'
          action: Script
          object_path: ln= Datatable.Value(2)
      - step:
          id: '8'
          action: Script
          object_path: co= Datatable.Value(3)
      - step:
          id: '9'
          action: Script
          object_path: ro= Datatable.Value(4)
      - step:
          id: '10'
          action: Script
          object_path: ad= Datatable.Value(5)
      - step:
          id: '11'
          action: Script
          object_path: em= Datatable.Value(6)
      - step:
          id: '12'
          action: Script
          object_path: ph= Datatable.Value(7)
      - step:
          id: '13'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebEdit("Address_Input")'
          action: Set
          args: ad
      - step:
          id: '14'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebEdit("Role")'
          action: Set
          args: ro
      - step:
          id: '15'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebEdit("Company")'
          action: Set
          args: co
      - step:
          id: '16'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebEdit("Email")'
          action: Set
          args: em
      - step:
          id: '17'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebEdit("First")'
          action: Set
          args: fn
      - step:
          id: '18'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebEdit("Last")'
          action: Set
          args: ln
      - step:
          id: '19'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebEdit("Phone")'
          action: Set
          args: ph
      - step:
          id: '20'
          object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebButton("Submit")'
          action: Click
      - step:
          id: '21'
          action: Script
          object_path: Next
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
        class: Browser
        name: Rpa Challenge
        properties:
          - property:
              value:
                value: Rpa Challenge
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'http://www.rpachallenge.com'
                regular_expression: false
              name: openurl
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Rpa Challenge
                regular_expression: false
              name: opentitle
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: openedbytestingtool
              hidden: true
              read_only: true
              type: BOOL
          - property:
              value:
                value: '5'
                regular_expression: false
              name: number of tabs
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: Rpa Challenge
                regular_expression: false
              name: name
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Browser
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '1'
                regular_expression: false
              name: browserindex
              hidden: true
              read_only: true
              type: I2
        basic_identification:
          property_ref:
            - micclass
          ordinal_identifier:
            value: 4
            type: creationtime
        smart_identification:
          base_filter:
            property_ref:
              - micclass
          optional_filter:
            property_ref:
              - name
              - title
              - openurl
              - opentitle
              - openedbytestingtool
              - number of tabs
          algorithm: Mercury.TolerantPriority
          active: true
        custom_replay: ''
        comments: ''
        visual_relations: ''
        last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
        child_objects:
          - object:
              class: Page
              name: Rpa Challenge
              properties:
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: user-input in post data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: user input in get data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'http://www.rpachallenge.com'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'http://www.rpachallenge.com'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Rpa Challenge
                      regular_expression: false
                    name: title
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: non user-input in post data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: non user-input in get data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Page
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: '10011'
                      regular_expression: false
                    name: index
                    hidden: true
                    read_only: true
                    type: NUMBER
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: document size
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: all data in get method
                    hidden: true
                    read_only: true
                    type: STRING
              basic_identification:
                property_ref:
                  - micclass
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                    - micclass
                optional_filter:
                  property_ref:
                    - title
                    - url
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
              child_objects:
                - object:
                    class: WebElement
                    name: Role in Company
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Role in Company
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/RPA1-FIELD/DIV/LABEL[normalize-space()="Role in Company"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebElement
                    name: Phone Number
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Phone Number
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/RPA1-FIELD/DIV/LABEL[normalize-space()="Phone Number"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebElement
                    name: Last Name
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Last Name
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/RPA1-FIELD/DIV/LABEL[normalize-space()="Last Name"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebElement
                    name: First Name
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: First Name
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/RPA1-FIELD/DIV/LABEL[normalize-space()="First Name"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebElement
                    name: Email
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Email
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/RPA1-FIELD/DIV/LABEL[normalize-space()="Email"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebElement
                    name: Company Name
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Company Name
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/RPA1-FIELD/DIV/LABEL[normalize-space()="Company Name"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebElement
                    name: Address
                    properties:
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: WebElement
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Address
                            regular_expression: false
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: LABEL
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/RPA1-FIELD/DIV/LABEL[normalize-space()="Address"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - innertext
                        - html tag
                        - _xpath
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - html id
                          - class
                          - innertext
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebEdit
                    name: Role
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '.*'
                            regular_expression: true
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay:
                      behavior: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations:
                      visual_relation:
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'True'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Role in Company")'
                          relative_position: above
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'False'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Role in Company")'
                          relative_position: closest-y
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebEdit
                    name: Phone
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '.*'
                            regular_expression: true
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay:
                      behavior: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations:
                      visual_relation:
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'True'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Phone Number")'
                          relative_position: above
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'False'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Phone Number")'
                          relative_position: closest-y
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebEdit
                    name: Last
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '.*'
                            regular_expression: true
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay:
                      behavior: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations:
                      visual_relation:
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'True'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Last Name")'
                          relative_position: above
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'False'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Last Name")'
                          relative_position: closest-y
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebEdit
                    name: First
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '.*'
                            regular_expression: true
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay:
                      behavior: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations:
                      visual_relation:
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'True'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("First Name")'
                          relative_position: above
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'False'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("First Name")'
                          relative_position: closest-y
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebEdit
                    name: Email
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '.*'
                            regular_expression: true
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay:
                      behavior: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations:
                      visual_relation:
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'True'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Email")'
                          relative_position: above
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'False'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Email")'
                          relative_position: closest-y
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebEdit
                    name: Company
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '.*'
                            regular_expression: true
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay:
                      behavior: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations:
                      visual_relation:
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'True'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Company Name")'
                          relative_position: above
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'False'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Company Name")'
                          relative_position: closest-y
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebEdit
                    name: Address_Input
                    properties:
                      - property:
                          value:
                            value: WebEdit
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: text
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '.*'
                            regular_expression: true
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay:
                      behavior: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations:
                      visual_relation:
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'True'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Address")'
                          relative_position: above
                        - arguments:
                            - argument:
                                - name: inline
                                  value:
                                    value: 'False'
                                    type: BOOL
                          related_object_path: 'Browser("Rpa Challenge").Page("Rpa Challenge").WebElement("Address")'
                          relative_position: closest-y
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebButton
                    name: Submit
                    properties:
                      - property:
                          value:
                            value: WebButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV[2]/APP-RPA1[1]/DIV[1]/DIV[2]/FORM[1]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '116'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: '465'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '543'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: Submit
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: submit
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Submit
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: INPUT
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '36'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: btn uiColorButton
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '536'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '543'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebButton
                    name: Start
                    properties:
                      - property:
                          value:
                            value: WebButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/APP-RPA1/DIV/DIV/DIV/BUTTON[normalize-space()="Start"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: Start
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: submit
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Start
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: BUTTON
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: waves-effect col s12 m12 l12 btn-large uiColorButton
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
                - object:
                    class: WebButton
                    name: Reset
                    properties:
                      - property:
                          value:
                            value: WebButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//DIV/APP-RPA1/DIV/DIV/DIV/BUTTON[normalize-space()="Reset"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '100'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '-1'
                            regular_expression: false
                          name: visible
                          hidden: true
                          read_only: true
                          type: BOOL
                      - property:
                          value:
                            value: '364'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '10'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: Reset
                            regular_expression: false
                          name: value
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: submit
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Reset
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: BUTTON
                            regular_expression: false
                          name: html tag
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '54'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: waves-effect col s12 m12 l12 btn-large uiColorButton
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: acc_name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '452'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '15'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - type
                        - name
                        - html tag
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - name
                          - type
                          - html id
                          - value
                          - class
                          - visible
                          - acc_name
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, April 16, 2021 9:39:11 PM'
                    child_objects: []
  check_points_and_outputs: []
  parameters: []
