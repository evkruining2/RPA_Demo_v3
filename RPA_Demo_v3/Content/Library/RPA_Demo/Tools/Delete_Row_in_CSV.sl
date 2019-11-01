namespace: RPA_Demo.Tools
operation:
  name: Delete_Row_in_CSV
  inputs:
    - csvfile
    - row
    - csvfile2: "c:\\laps.csv"
  python_action:
    script: |-
      infile = open(csvfile,'r').readlines()
      with open(csvfile,'w') as outfile:
          for index,line in enumerate(infile):
              if index != int(row)-1:
                  outfile.write(line)
  results:
    - SUCCESS
