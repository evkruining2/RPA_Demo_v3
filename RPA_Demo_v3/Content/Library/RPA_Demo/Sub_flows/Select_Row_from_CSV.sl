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
          - NO_MORE: Set_Flow_variables_1
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
          - SUCCESS: list_iterator_1
    - list_iterator_1:
        do:
          io.cloudslang.base.lists.list_iterator:
            - list: '1,2'
        navigate:
          - HAS_MORE: list_iterator_1
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
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
        x: 48
        'y': 81
      list_iterator:
        x: 200
        'y': 76
      Set_Flow_variables_1:
        x: 371
        'y': 75
      list_iterator_1:
        x: 516
        'y': 73
        navigate:
          f55f7130-c02c-1267-c206-f1b37f38aca8:
            targetId: 59fd7b43-fe99-b517-d7c9-0533de7176c3
            port: NO_MORE
    results:
      SUCCESS:
        59fd7b43-fe99-b517-d7c9-0533de7176c3:
          x: 657
          'y': 162
