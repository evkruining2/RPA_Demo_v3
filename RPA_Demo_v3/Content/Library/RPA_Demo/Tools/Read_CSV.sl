########################################################################################################################
#!!
#! @description: Reads a given CSV file and puts the content in a array as output
#!!#
########################################################################################################################
namespace: RPA_Demo.Tools
operation:
  name: Read_CSV
  inputs:
    - csvfile
  python_action:
    script: "import csv\r\n\r\ncontent = []\r\nwith open(csvfile,'rb') as csvfile:\r\n    reader = csv.reader(csvfile, delimiter=',')\r\n    for row in reader: \r\n        content.append(row)"
  outputs:
    - content: '${str(content)}'
  results:
    - SUCCESS
