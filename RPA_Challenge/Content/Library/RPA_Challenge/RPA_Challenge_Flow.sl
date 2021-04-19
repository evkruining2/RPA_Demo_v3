########################################################################################################################
#!!
#! @input xls_location: This is the location (url) of the workload xls file for the test
#! @input local_file: The full path of the workload on the local filesystem. Example: c:\temp\challenge.xlsx
#!!#
########################################################################################################################
namespace: RPA_Challenge
flow:
  name: RPA_Challenge_Flow
  inputs:
    - xls_location: 'http://rpachallenge.com/assets/downloadFiles/challenge.xlsx'
    - local_file: "c:\\Temp\\challenge.xlsx"
  workflow:
    - Download_Workload:
        do:
          RPA_Challenge.Download_Workload:
            - xls_location: '${xls_location}'
            - local_file: '${local_file}'
        navigate:
          - SUCCESS: RPA_Challenge_all_in_one
    - RPA_Challenge_all_in_one:
        do:
          RPA_Challenge.RPA_Challenge_all_in_one:
            - Filename: '${local_file}'
        navigate:
          - SUCCESS: delete
          - WARNING: delete
          - FAILURE: on_failure
    - delete:
        do:
          io.cloudslang.base.filesystem.delete:
            - source: '${local_file}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Download_Workload:
        x: 71
        'y': 81
      RPA_Challenge_all_in_one:
        x: 265
        'y': 82
      delete:
        x: 450
        'y': 91
        navigate:
          9acbbb80-e710-0b5d-033f-7fa3abd70548:
            targetId: 85aeaddb-302f-7bb2-a750-42940bc971e9
            port: SUCCESS
    results:
      SUCCESS:
        85aeaddb-302f-7bb2-a750-42940bc971e9:
          x: 448
          'y': 269
