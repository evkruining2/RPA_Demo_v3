########################################################################################################################
#!!
#! @description: UI automation to modify the given user record in OrgangeHRM and add/change the SSN field.
#!
#! @input name: Name of the user to modify
#! @input ssn: SSN of the user to add into the OrangeHRM system
#!!#
########################################################################################################################
namespace: RPA_Demo.UI_Automation
flow:
  name: Put_SSN_in_HRM_system_flow
  inputs:
    - name: ray
    - ssn: '123456789'
  workflow:
    - Put_SSN_in_HRM_system:
        do:
          RPA_Demo.UI_Automation.Put_SSN_in_HRM_system:
            - name: '${name}'
            - ssn: '${ssn}'
        navigate:
          - SUCCESS:
              next_step: SUCCESS
              ROI: '10'
          - WARNING:
              next_step: SUCCESS
              ROI: '5'
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Put_SSN_in_HRM_system:
        x: 156
        'y': 177
        navigate:
          42a2ab54-7af1-9a2b-6ab4-616378b09b68:
            targetId: c1bb57a7-e5b5-67ca-cd7e-02868cb87389
            port: SUCCESS
          324e072d-6175-30bd-a68f-e932b0fc35fa:
            targetId: c1bb57a7-e5b5-67ca-cd7e-02868cb87389
            port: WARNING
    results:
      SUCCESS:
        c1bb57a7-e5b5-67ca-cd7e-02868cb87389:
          x: 320
          'y': 120
