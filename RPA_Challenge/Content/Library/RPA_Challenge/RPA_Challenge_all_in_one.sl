namespace: RPA_Challenge
operation:
  name: RPA_Challenge_all_in_one
  inputs:
    - Filename: "c:\\Temp\\challenge.xlsx"
  sequential_action:
    gav: 'com.microfocus.seq:RPA_Challenge.RPA_Challenge_all_in_one:1.2.0'
    skills:
      - SAPWebExt
      - UI Automation
      - Web
    settings:
      windows:
        active: true
        apps:
          app_1:
            args: ' --url="zoommtg://zoom.us/join?action=join&confno=92333748911&pwd=bkY5K3FpaFh3N09Ub3VRWXpwSzlsUT09"'
            directory: ''
            include_child_processes: true
            launch_application: true
            path: "C:\\Users\\Administrator\\AppData\\Roaming\\Zoom\\bin\\zoom.exe"
      web:
        active: true
        address: 'http://rpachallenge.com'
        browser: CHROME
        close_on_exit: false
    steps:
      - step:
          id: '1'
          object_path: 'UIAObject("Rpa Challenge - Google")'
          action: Maximize
      - step:
          id: '2'
          object_path: 'Browser("Rpa Challenge_2").Page("Rpa Challenge").WebButton("Start")'
          action: Click
          snapshot: ".\\Snapshots\\ssf19.html"
          highlight_id: '10000000'
      - step:
          id: '3'
          object_path: DataTable
          action: 'Import(Parameter("Filename"))'
      - step:
          id: '4'
          action: Script
          object_path: For i = 1 To 10 Step 1
      - step:
          id: '5'
          object_path: DataTable
          action: SetCurrentRow(i)
      - step:
          id: '6'
          action: Script
          object_path: fn= Datatable.Value(1)
      - step:
          id: '7'
          action: Script
          object_path: ln= Datatable.Value(2)
      - step:
          id: '8'
          action: Script
          object_path: co= Datatable.Value(3)
      - step:
          id: '9'
          action: Script
          object_path: ro= Datatable.Value(4)
      - step:
          id: '10'
          action: Script
          object_path: ad= Datatable.Value(5)
      - step:
          id: '11'
          action: Script
          object_path: em= Datatable.Value(6)
      - step:
          id: '12'
          action: Script
          object_path: ph= Datatable.Value(7)
      - step:
          id: '13'
          object_path: 'Browser("Rpa Challenge_2").InsightObject("InsightObject_3")'
          action: Click
          snapshot: ".\\Snapshots\\ssf24.png"
          highlight_id: '18'
      - step:
          id: '14'
          object_path: 'Window("Google Chrome")'
          action: Type
          args: fn
      - step:
          id: '15'
          object_path: 'Browser("Rpa Challenge_2").InsightObject("InsightObject_6")'
          action: Click
          snapshot: ".\\Snapshots\\ssf30.png"
          highlight_id: '39'
      - step:
          id: '16'
          object_path: 'Window("Google Chrome")'
          action: Type
          args: ln
      - step:
          id: '17'
          object_path: 'Browser("Rpa Challenge_2").InsightObject("InsightObject_4")'
          action: Click
          snapshot: ".\\Snapshots\\ssf26.png"
          highlight_id: '25'
      - step:
          id: '18'
          object_path: 'Window("Google Chrome")'
          action: Type
          args: co
      - step:
          id: '19'
          object_path: 'Browser("Rpa Challenge_2").InsightObject("InsightObject")'
          action: Click
          snapshot: ".\\Snapshots\\ssf20.png"
          highlight_id: '3'
      - step:
          id: '20'
          object_path: 'Window("Google Chrome")'
          action: Type
          args: ro
          snapshot: ".\\Snapshots\\ssf21.png"
          highlight_id: '7471668'
      - step:
          id: '21'
          object_path: 'Browser("Rpa Challenge_2").InsightObject("InsightObject_2")'
          action: Click
          snapshot: ".\\Snapshots\\ssf22.png"
          highlight_id: '11'
      - step:
          id: '22'
          object_path: 'Window("Google Chrome")'
          action: Type
          args: ad
          snapshot: ".\\Snapshots\\ssf23.png"
          highlight_id: '7471668'
      - step:
          id: '23'
          object_path: 'Browser("Rpa Challenge_2").InsightObject("InsightObject_5")'
          action: Click
          snapshot: ".\\Snapshots\\ssf28.png"
          highlight_id: '32'
      - step:
          id: '24'
          object_path: 'Window("Google Chrome")'
          action: Type
          args: em
          snapshot: ".\\Snapshots\\ssf29.png"
          highlight_id: '7471668'
      - step:
          id: '25'
          object_path: 'Browser("Rpa Challenge_2").InsightObject("InsightObject_7")'
          action: Click
      - step:
          id: '26'
          object_path: 'Window("Google Chrome")'
          action: Type
          args: ph
          snapshot: ".\\Snapshots\\ssf33.png"
          highlight_id: '7471668'
      - step:
          id: '27'
          object_path: 'Browser("Rpa Challenge_2").Page("Rpa Challenge").WebButton("Submit")'
          action: Click
          snapshot: ".\\Snapshots\\ssf34.html"
          highlight_id: '10000000'
      - step:
          id: '28'
          action: Script
          object_path: Next
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
    - result_score: '${return_result}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
