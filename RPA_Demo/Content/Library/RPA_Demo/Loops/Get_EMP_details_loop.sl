########################################################################################################################
#!!
#! @description: Loop through the given list of users in OrangeHRM and get their details
#!
#! @input names: List of users in OrangeHRM (comma separated)
#!!#
########################################################################################################################
namespace: RPA_Demo.Loops
flow:
  name: Get_EMP_details_loop
  inputs:
    - names: 'ray,steve,rianne,floris'
  workflow:
    - Get_EMP_details_from_HRM:
        loop:
          for: i in names
          do:
            RPA_Demo.UI_Automation.Get_EMP_details_from_HRM:
              - name: '${i}'
          break:
            - FAILURE
          publish:
            - empID
            - phone
            - job_Title
            - email
        navigate:
          - SUCCESS:
              next_step: SUCCESS
              ROI: '33'
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Get_EMP_details_from_HRM:
        x: 88
        'y': 74
        navigate:
          b97f853a-4d75-fa09-2db2-0cd9b41b9a02:
            targetId: 1dfae5d3-1ff8-e917-e7e6-cb9d14d3223a
            port: SUCCESS
          459fdbe0-6d7a-ac56-b37b-cd366d657fc7:
            targetId: 1dfae5d3-1ff8-e917-e7e6-cb9d14d3223a
            port: WARNING
    results:
      SUCCESS:
        1dfae5d3-1ff8-e917-e7e6-cb9d14d3223a:
          x: 317
          'y': 73
