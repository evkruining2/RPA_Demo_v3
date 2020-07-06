########################################################################################################################
#!!
#! @input fn: First Name
#! @input ln: Last Name
#! @input pictureid: Path to the Picture ID
#!!#
########################################################################################################################
namespace: Test_flows
flow:
  name: OCR_Test_2
  inputs:
    - fn: nick
    - ln: sample
    - pictureid: "c:\\demo\\example5.jpg"
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
            - file_path: '${pictureid}'
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
          - SUCCESS: string_equals
          - FAILURE: on_failure
    - string_equals:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${fn}'
            - second_string: '${firstName}'
            - ignore_case: 'true'
        navigate:
          - SUCCESS: string_equals_1
          - FAILURE: on_failure
    - string_equals_1:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${ln}'
            - second_string: '${lastName}'
            - ignore_case: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - firstname: '${firstName}'
    - lastname: '${lastName}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      tesseract_setup:
        x: 45
        'y': 79
      extract_text_from_image:
        x: 234
        'y': 78
      json_path_query:
        x: 436
        'y': 79
      string_equals:
        x: 473
        'y': 260
      string_equals_1:
        x: 472
        'y': 425
        navigate:
          f917f40b-3cff-1435-5eaf-12b9f2140bcd:
            targetId: b9146eb4-0f1b-9148-4d91-807307ee93dc
            port: SUCCESS
    results:
      SUCCESS:
        b9146eb4-0f1b-9148-4d91-807307ee93dc:
          x: 262
          'y': 420
