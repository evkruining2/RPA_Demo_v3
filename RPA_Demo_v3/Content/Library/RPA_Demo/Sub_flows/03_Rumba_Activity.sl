namespace: RPA_Demo.Sub_flows
operation:
  name: 03_Rumba_Activity
  inputs:
  - name
  - sapcode
  - ID
  outputs:
  - MFmessage:
      robot: true
      value: ${MFmessage}
  - return_result: ${return_result}
  - error_message: ${error_message}
  sequential_action:
    gav: com.microfocus.seq:RPA_Demo.Sub_flows.03_Rumba_Activity:1.0.0
    external: true
  results:
  - SUCCESS
  - WARNING
  - FAILURE
