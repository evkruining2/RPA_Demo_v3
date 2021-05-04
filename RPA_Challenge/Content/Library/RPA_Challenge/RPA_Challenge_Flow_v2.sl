########################################################################################################################
#!!
#! @input xls_location: This is the location (url) of the workload xls file for the test
#! @input local_file: The full path of the workload on the local filesystem. Example: c:\temp\challenge.xlsx
#!!#
########################################################################################################################
namespace: RPA_Challenge
flow:
  name: RPA_Challenge_Flow_v2
  inputs:
    - xls_location: 'http://rpachallenge.com/assets/downloadFiles/challenge.xlsx'
    - local_file: "c:\\Temp\\challenge.xlsx"
    - proxy:
        required: false
  workflow:
    - Download_Workload:
        do:
          RPA_Challenge.Download_Workload:
            - xls_location: '${xls_location}'
            - local_file: '${local_file}'
        navigate:
          - SUCCESS: RPA_Challenge_v2
    - delete:
        do:
          io.cloudslang.base.filesystem.delete:
            - source: '${local_file}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - RPA_Challenge_v2:
        do:
          RPA_Challenge.RPA_Challenge_v2:
            - Filename: '${local_file}'
        navigate:
          - SUCCESS: delete
          - WARNING: delete
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
      delete:
        x: 418
        'y': 86
        navigate:
          9acbbb80-e710-0b5d-033f-7fa3abd70548:
            targetId: 85aeaddb-302f-7bb2-a750-42940bc971e9
            port: SUCCESS
      RPA_Challenge_v2:
        x: 242
        'y': 82
    results:
      SUCCESS:
        85aeaddb-302f-7bb2-a750-42940bc971e9:
          x: 420
          'y': 267
