namespace: RPA_Demo.Test
flow:
  name: Read_line_in_file
  inputs:
    - fileName: "c:\\Enablement\\hackton\\data\\laptops.csv"
    - lineNumber: '2'
  workflow:
    - Read_line_from_file:
        do:
          RPA_Demo.Tools.Read_line_from_file:
            - inFile: '${fileName}'
            - lineNumber: '${lineNumber}'
        publish:
          - line
        navigate:
          - SUCCESS: SUCCESS
  outputs:
    - content: '${line}'
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Read_line_from_file:
        x: 89
        'y': 100.59999084472656
        navigate:
          2dcf13be-7b54-3f35-7d38-9ffffe5689ce:
            targetId: 0a5cf678-06e5-caf2-9ad0-038861e6e751
            port: SUCCESS
    results:
      SUCCESS:
        0a5cf678-06e5-caf2-9ad0-038861e6e751:
          x: 283
          'y': 66
