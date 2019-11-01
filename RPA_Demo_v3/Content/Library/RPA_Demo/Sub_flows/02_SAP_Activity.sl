namespace: RPA_Demo.Sub_flows
operation:
  name: 02_SAP_Activity
  outputs:
  - SAPcode:
      robot: true
      value: ${SAPcode}
  - return_result: ${return_result}
  - error_message: ${error_message}
  sequential_action:
    gav: com.microfocus.seq:RPA_Demo.Sub_flows.02_SAP_Activity:1.0.0
    external: true
  results:
  - SUCCESS
  - WARNING
  - FAILURE
