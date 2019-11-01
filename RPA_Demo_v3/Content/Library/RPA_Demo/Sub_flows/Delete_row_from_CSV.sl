namespace: RPA_Demo.Sub_flows
flow:
  name: Delete_row_from_CSV
  inputs:
    - csvfile
    - row
  workflow:
    - Delete_Row_in_CSV_1:
        do:
          RPA_Demo.Tools.Delete_Row_in_CSV:
            - csvfile: '${csvfile}'
            - row: '${row}'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Delete_Row_in_CSV_1:
        x: 243
        'y': 184
        navigate:
          ef80210f-728b-e50c-dd0b-f3b7c88b8483:
            targetId: 773156d4-3152-3d72-31e7-23df09e3d769
            port: SUCCESS
    results:
      SUCCESS:
        773156d4-3152-3d72-31e7-23df09e3d769:
          x: 501
          'y': 176
