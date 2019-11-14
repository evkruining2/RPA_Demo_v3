namespace: RPA_Demo.Sub_flows
flow:
  name: Add_item_to_AOS_catalog
  inputs:
    - itemName
    - itemNumber
    - itemDesc
    - itemPrice
  workflow:
    - http_client_post:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: 'http://localhost:8080/catalog/api/v1/products'
            - auth_type: basic
            - username: admin
            - password:
                value: adm1n
                sensitive: true
            - trust_all_roots: 'true'
            - x_509_hostname_verifier: allow_all
            - headers: null
            - body: "${'{\"productId\": ' +itemNumber+ ',\"categoryId\": 1,\"productName\": \"' +itemName+ '\",\"price\": ' +itemPrice+ ',\"description\": \"' +itemDesc+ '\",\"imageUrl\": \"1700\",\"attributes\": [{\"attributeName\": \"COMPATIBILITY\",\"attributeValue\": \"All\"},{\"attributeName\": \"DISPLAY SIZE\",\"attributeValue\": \"Large\"},{\"attributeName\": \"DISPLAY\",\"attributeValue\": \"Nice\"}],\"colors\": [{\"code\": \"C3C3C3\",\"name\": \"GRAY\",\"inStock\": 10}],\"images\": [\"ABCDEF##1700\",\"ABCDEF##1702\",\"ABCDEF##1703\",\"C3C3C3##1701\"],\"productStatus\": \"Active\"}'}"
            - content_type: Application/json
        publish:
          - return_result
          - error_message
          - return_code
          - status_code
          - response_headers
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - status_code: '${status_code}'
    - return_result: '${return_result}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      http_client_post:
        x: 147
        'y': 167
        navigate:
          a7269c2f-87b7-fabd-2b8a-5aa1ff040368:
            targetId: 6b16ed5a-111c-9d85-1cb6-3784b0916022
            port: SUCCESS
    results:
      SUCCESS:
        6b16ed5a-111c-9d85-1cb6-3784b0916022:
          x: 395
          'y': 240
