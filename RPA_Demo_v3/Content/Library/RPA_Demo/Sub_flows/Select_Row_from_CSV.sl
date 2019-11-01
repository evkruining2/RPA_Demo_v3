########################################################################################################################
#!!
#! @input rowNumer: Set the row number in the CSV file to process
#!!#
########################################################################################################################
namespace: RPA_Demo.Sub_flows
flow:
  name: Select_Row_from_CSV
  inputs:
    - rowNumer
    - csvfile: "C:\\Enablement\\Hackton\\data\\laptops.csv"
  workflow:
    - Read_CSV_1:
        do:
          RPA_Demo.Tools.Read_CSV:
            - csvfile: '${csvfile}'
        publish:
          - content
        navigate:
          - SUCCESS: list_iterator
    - list_iterator:
        loop:
          for: 'n in range(0,int(rowNumer))'
          do:
            io.cloudslang.base.lists.list_iterator:
              - list: '${content}'
              - separator: ']'
          break:
            - FAILURE
          publish:
            - result_string: "${result_string.replace('[' , '')}"
        navigate:
          - HAS_MORE: Set_Flow_variables_1
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
    - Set_Flow_variables_1:
        do:
          RPA_Demo.Tools.Set_Flow_variables:
            - line: "${result_string.strip(',')}"
        publish:
          - a: '${eval(a)}'
          - b: '${eval(b)}'
          - c: '${eval(c)}'
          - d: '${eval(d)}'
        navigate:
          - SUCCESS: SUCCESS
  outputs:
    - itemNumber: '${a}'
    - itemName: '${b}'
    - itemDesc: '${c}'
    - itemPrice: '${d}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Read_CSV_1:
        x: 61
        'y': 102
      list_iterator:
        x: 210
        'y': 92
        navigate:
          9b4614bf-7221-8f78-b720-11614aa61882:
            targetId: 59fd7b43-fe99-b517-d7c9-0533de7176c3
            port: NO_MORE
            vertices:
              - x: 375
                'y': 59
              - x: 417
                'y': 60
              - x: 444
                'y': 64
              - x: 452
                'y': 56
      Set_Flow_variables_1:
        x: 374
        'y': 112
        navigate:
          7a659280-5a71-7a8f-fb70-97a5ea9275f4:
            targetId: 59fd7b43-fe99-b517-d7c9-0533de7176c3
            port: SUCCESS
    results:
      SUCCESS:
        59fd7b43-fe99-b517-d7c9-0533de7176c3:
          x: 556
          'y': 93
