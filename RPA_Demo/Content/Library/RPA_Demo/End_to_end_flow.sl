########################################################################################################################
#!!
#! @description: Simple end-to-end flow that will fetch the SSN from the given user out of the SSN database (API), modifies the users record in OrangeHRM (UI) and writes the results in Notepad (UI)
#!
#! @input name: Name of the user to modify
#!!#
########################################################################################################################
namespace: RPA_Demo
flow:
  name: End_to_end_flow
  inputs:
    - name: erwin
  workflow:
    - Get_SSN_from_DB:
        do:
          RPA_Demo.API_Automation.Get_SSN_from_DB:
            - name: '${name}'
        publish:
          - ssn
        navigate:
          - FAILURE: on_failure
          - SUCCESS:
              next_step: Put_SSN_in_HRM_system
              ROI: '5'
    - Put_SSN_in_HRM_system:
        do:
          RPA_Demo.UI_Automation.Put_SSN_in_HRM_system:
            - name: '${name}'
            - ssn: '${ssn}'
        navigate:
          - SUCCESS:
              next_step: Display_results_in_Notepad
              ROI: '10'
          - WARNING:
              next_step: Display_results_in_Notepad
              ROI: '5'
          - FAILURE: on_failure
    - Display_results_in_Notepad:
        do:
          RPA_Demo.UI_Automation.Display_results_in_Notepad:
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
      Get_SSN_from_DB:
        x: 70
        'y': 94
      Put_SSN_in_HRM_system:
        x: 237
        'y': 95
      Display_results_in_Notepad:
        x: 421
        'y': 93
        navigate:
          712a56fc-8518-6775-7f02-821af079841a:
            targetId: 8f8f35ad-a128-bd08-8269-af6425a78ca3
            port: SUCCESS
          e3f85efc-6286-cec3-d8e7-461c5afaa305:
            targetId: 8f8f35ad-a128-bd08-8269-af6425a78ca3
            port: WARNING
    results:
      SUCCESS:
        8f8f35ad-a128-bd08-8269-af6425a78ca3:
          x: 579
          'y': 86
