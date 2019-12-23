namespace: flows
flow:
  name: OCR_an_image
  inputs:
    - picture: "c:\\temp\\example.jpg"
  workflow:
    - tesseract_setup:
        do:
          io.cloudslang.tesseract.ocr.utils.tesseract_setup:
            - data_path: "c:\\temp"
        publish:
          - data_path_output
        navigate:
          - SUCCESS: extract_text_from_image
          - FAILURE: on_failure
    - extract_text_from_image:
        do:
          io.cloudslang.tesseract.ocr.extract_text_from_image:
            - file_path: '${picture}'
            - data_path: '${data_path_output}'
            - language: ENG
            - text_blocks: 'false'
        publish:
          - text_string
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
        navigate:
          966ab222-bdcb-0582-b55f-76d09847f451:
            targetId: 99858621-9435-1943-5a6a-71a706d8a6d0
            port: SUCCESS
    results:
      SUCCESS:
        99858621-9435-1943-5a6a-71a706d8a6d0:
          x: 387
          'y': 136
