namespace: RPA_Challenge
operation:
  name: Download_Workload
  inputs:
    - xls_location
    - local_file
  python_action:
    use_jython: false
    script: "# do not remove the execute function\r\ndef execute(xls_location,local_file):\r\n    # code goes here\r\n    import urllib.request\r\n    urllib.request.urlretrieve(xls_location, local_file)"
  results:
    - SUCCESS
