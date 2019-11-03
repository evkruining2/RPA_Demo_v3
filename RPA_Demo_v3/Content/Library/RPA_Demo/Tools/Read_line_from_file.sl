########################################################################################################################
#!!
#! @description: Reads a line from a text file. Line-count starts with 0 (so the first line in the file is line number 0)
#!!#
########################################################################################################################
namespace: RPA_Demo.Tools
operation:
  name: Read_line_from_file
  inputs:
    - inFile
    - lineNumber
  python_action:
    script: "with open(inFile) as f:\r\n    line = f.readlines()[int(lineNumber)]"
  outputs:
    - line
  results:
    - SUCCESS
