########################################################################################################################
#!!
#! @description: This flow will kill the running applications, listed as process names in the input, running on a target windows system. 
#!               
#!               In order to execute properly, windows remote management needs to be configured properly in the target. To do so, run these power shell commands on the target once:
#!               
#!               winrm quickconfig
#!               winrm set winrm/config/service/auth '@{Basic="true"}'
#!               winrm set winrm/config/service '@{AllowUnencrypted="true"}'
#!               winrm set winrm/config/client '@{AllowUnencrypted="true"}'
#!                
#!               to test settings: 
#!                
#!               winrm identify -r:http://localhost:5985 -auth:basic -u:administrator -p:<admin password> -encoding:utf-8
#!                
#!               
#!!#
########################################################################################################################
namespace: RPA_Demo.Sub_flows
flow:
  name: Cleanup_Environment
  inputs:
    - processNames: 'RumbaPage.exe, Firefox.exe,saplogon.exe,AdvantageShopAdministrator.exe'
    - WinAdminUser: administrator
    - WinAdminPassword:
        default: admin@123
        private: false
        sensitive: true
  workflow:
    - list_iterator:
        do:
          io.cloudslang.base.lists.list_iterator:
            - list: '${processNames}'
            - separator: ','
        publish:
          - processName: '${result_string}'
        navigate:
          - HAS_MORE: kill_open_apps
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
    - kill_open_apps:
        do:
          io.cloudslang.base.powershell.powershell_script:
            - host: localhost
            - port: '5985'
            - protocol: http
            - username: '${WinAdminUser}'
            - password:
                value: '${WinAdminPassword}'
                sensitive: true
            - auth_type: null
            - trust_all_roots: 'true'
            - x_509_hostname_verifier: allow_all
            - script: "${'Taskkill /IM '+processName+' /F'}"
        navigate:
          - SUCCESS: list_iterator
          - FAILURE: list_iterator
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      list_iterator:
        x: 142
        'y': 122
        navigate:
          3e32a814-be55-00cb-5464-8eeb9fb70453:
            targetId: e75c884f-aa70-8a5e-b002-60cbf9ba9a46
            port: NO_MORE
      kill_open_apps:
        x: 370
        'y': 70
    results:
      SUCCESS:
        e75c884f-aa70-8a5e-b002-60cbf9ba9a46:
          x: 350
          'y': 288
