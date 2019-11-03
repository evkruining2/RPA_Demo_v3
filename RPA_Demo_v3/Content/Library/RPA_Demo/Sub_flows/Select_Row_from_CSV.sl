########################################################################################################################
#!!
#! @description: Selects a row from a 4-column csv file and creates 4 flow variables as a result. The row-count starts a 0, so row 0 is the first line in the file.
#!
#! @input rowNumer: Set the row number in the CSV file to process. Count starts a 0
#!!#
########################################################################################################################
namespace: RPA_Demo.Sub_flows
flow:
  name: Select_Row_from_CSV
  inputs:
    - rowNumer
    - csvfile: "C:\\Enablement\\Hackton\\data\\laptops.csv"
  workflow:
    - Read_line_from_file:
        do:
          RPA_Demo.Tools.Read_line_from_file:
            - inFile: '${csvfile}'
            - lineNumber: '${rowNumer}'
        publish:
          - line
        navigate:
          - SUCCESS: Set_Flow_variables
    - Set_Flow_variables:
        do:
          RPA_Demo.Tools.Set_Flow_variables:
            - line: "${line.strip(',')}"
        publish:
          - itemName: '${b}'
          - itemDesc: '${c}'
          - itemPrice: '${d}'
          - itemNumber: '${a}'
        navigate:
          - SUCCESS: SUCCESS
  outputs:
    - itemNumber: '${itemNumber}'
    - itemName: '${itemName}'
    - itemDesc: '${itemDesc}'
    - itemPrice: '${itemPrice}'
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Read_line_from_file:
        x: 86
        'y': 95
      Set_Flow_variables:
        x: 272
        'y': 94
        navigate:
          33379505-a510-8983-21e4-a3e6d3a1e77d:
            targetId: 59fd7b43-fe99-b517-d7c9-0533de7176c3
            port: SUCCESS
    results:
      SUCCESS:
        59fd7b43-fe99-b517-d7c9-0533de7176c3:
          x: 469
          'y': 89
