########################################################################################################################
#!!
#! @description: Get a comma separated list of usernames within the SSN database. Can be used as inputs to other loop flows
#!
#! @output list_of_names: Comma separated list of names within the SSN database
#!!#
########################################################################################################################
namespace: RPA_Demo.Loops
flow:
  name: Get_list_of_all_users
  workflow:
    - sql_query:
        do:
          io.cloudslang.base.database.sql_query:
            - db_server_name: localhost
            - db_type: PostgreSQL
            - username: postgres
            - password:
                value: admin
                sensitive: true
            - db_port: '5432'
            - database_name: ssn
            - command: select name from public.ssn;
            - trust_all_roots: 'true'
            - key: key
        publish:
          - name: '${return_result}'
        navigate:
          - HAS_MORE: append
          - NO_MORE:
              next_step: strip_trailing_comma
              ROI: '5'
          - FAILURE: on_failure
    - append:
        do:
          io.cloudslang.base.strings.append:
            - origin_string: "${get('new_string', \"\")}"
            - text: "${name+','}"
        publish:
          - new_string
        navigate:
          - SUCCESS:
              next_step: sql_query
              ROI: '5'
    - strip_trailing_comma:
        do:
          io.cloudslang.base.utils.do_nothing:
            - input_0: '${new_string}'
        publish:
          - list_of_names: '${input_0[:-1]}'
        navigate:
          - SUCCESS:
              next_step: SUCCESS
              ROI: '5'
          - FAILURE: on_failure
  outputs:
    - list_of_names: '${list_of_names}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      sql_query:
        x: 108
        'y': 95
      append:
        x: 190
        'y': 253
      strip_trailing_comma:
        x: 287
        'y': 90
        navigate:
          affc08fa-28a8-0b59-05a8-0da31884e1f6:
            targetId: 6a1f3bb5-55f7-dbbb-0b9b-3911d0722448
            port: SUCCESS
    results:
      SUCCESS:
        6a1f3bb5-55f7-dbbb-0b9b-3911d0722448:
          x: 456
          'y': 84
