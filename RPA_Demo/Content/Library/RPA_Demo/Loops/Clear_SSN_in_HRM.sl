########################################################################################################################
#!!
#! @description: This flow sets the SSN field in OrangeHRM to -null- for the given list of (comma separated) users to reset the demo
#!
#! @input names: List of users in OrangeHRM to clear the SSN for (comma separated)
#!!#
########################################################################################################################
namespace: RPA_Demo.Loops
flow:
  name: Clear_SSN_in_HRM
  inputs:
    - names: 'johan,floris,trudy'
  workflow:
    - Put_SSN_in_HRM_system:
        loop:
          for: i in names
          do:
            RPA_Demo.UI_Automation.Put_SSN_in_HRM_system:
              - name: '${i}'
              - ssn: '-null-'
          break:
            - FAILURE
        navigate:
          - SUCCESS:
              next_step: SUCCESS
              ROI: '3'
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Put_SSN_in_HRM_system:
        x: 170
        'y': 132
        navigate:
          9d0209be-b153-e13f-d434-5477fc02e11e:
            targetId: 55fa18bb-ddb5-1bfa-9c3c-63a2643b310b
            port: SUCCESS
          7099ff15-6915-ea35-2272-b26ce5bbed03:
            targetId: 55fa18bb-ddb5-1bfa-9c3c-63a2643b310b
            port: WARNING
    results:
      SUCCESS:
        55fa18bb-ddb5-1bfa-9c3c-63a2643b310b:
          x: 375
          'y': 130
