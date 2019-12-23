namespace: SAP_dev.Sub_Flows
flow:
  name: OCR_Get_ID
  inputs:
    - pictureID: "c:\\demo\\example5.jpg"
  workflow:
    - tesseract_setup:
        do:
          io.cloudslang.tesseract.ocr.utils.tesseract_setup:
            - data_path: "c:\\demo"
        publish:
          - data_path_output
        navigate:
          - SUCCESS: extract_text_from_image
          - FAILURE: on_failure
    - extract_text_from_image:
        do:
          io.cloudslang.tesseract.ocr.extract_text_from_image:
            - file_path: '${pictureID}'
            - data_path: '${data_path_output}'
            - language: ENG
            - text_blocks: 'true'
        publish:
          - text_string
          - text_json
        navigate:
          - SUCCESS: json_path_query
          - FAILURE: on_failure
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${text_json}'
            - json_path: $.text_block_0
        publish:
          - return_result
          - lastName: "${return_result.split('\\\\n')[0].split()[1]}"
          - firstName: "${return_result.split('\\\\n')[1].split()[1]}"
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - firstName: '${firstName}'
    - lastName: '${lastName}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      tesseract_setup:
        x: 65
        'y': 99
      extract_text_from_image:
        x: 227
        'y': 99
      json_path_query:
        x: 404
        'y': 100
        navigate:
          ad012a9e-ef5d-933d-2497-bbd8cd9f35c0:
            targetId: 99858621-9435-1943-5a6a-71a706d8a6d0
            port: SUCCESS
    results:
      SUCCESS:
        99858621-9435-1943-5a6a-71a706d8a6d0:
          x: 402
          'y': 291
