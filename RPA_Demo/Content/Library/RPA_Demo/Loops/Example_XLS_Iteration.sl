namespace: RPA_Demo.Loops
flow:
  name: Example_XLS_Iteration
  inputs:
    - xls_file: "c:\\Temp\\challenge.xlsx"
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: '${xls_file}'
            - worksheet_name: Sheet1
            - has_header: 'yes'
            - row_index: '1:10'
        publish:
          - header
          - return_result
          - rows_count
        navigate:
          - SUCCESS: list_iterator
          - FAILURE: on_failure
    - list_iterator:
        do:
          io.cloudslang.base.lists.list_iterator:
            - list: '${return_result}'
            - separator: '|'
        publish:
          - row: "${result_string.strip(',')}"
        navigate:
          - HAS_MORE: Set_Flow_Variables
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
    - do_nothing:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: list_iterator
          - FAILURE: on_failure
    - Set_Flow_Variables:
        do:
          RPA_Demo.Loops.Set_Flow_Variables:
            - line: '${row}'
        publish:
          - First_Name: '${a}'
          - Last_name: '${b}'
          - Company_Name: '${c}'
          - Role_in_Company: '${d}'
          - Address: '${e}'
          - Email: '${f}'
          - Phone_Number: "${str(float(g)).strip('0').strip('.')}"
        navigate:
          - SUCCESS: do_nothing
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_cell:
        x: 246
        'y': 90
      list_iterator:
        x: 408
        'y': 86
        navigate:
          b8c0b22a-f31b-4b8f-3902-b6f4ac716c02:
            targetId: f657841e-7ee0-eb42-9468-e8af0c8071f3
            port: NO_MORE
      do_nothing:
        x: 471
        'y': 278
      Set_Flow_Variables:
        x: 284
        'y': 283
    results:
      SUCCESS:
        f657841e-7ee0-eb42-9468-e8af0c8071f3:
          x: 602
          'y': 92
