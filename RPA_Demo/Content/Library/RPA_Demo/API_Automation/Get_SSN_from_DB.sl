########################################################################################################################
#!!
#! @description: Run a SQL query against the SSN database (Postgresql) to get the SSN for the given user
#!
#! @input name: Name of the user to retrieve the SSN for from the SSN DB
#!!#
########################################################################################################################
namespace: RPA_Demo.API_Automation
flow:
  name: Get_SSN_from_DB
  inputs:
    - name: steve
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
            - command: "${\"select ssn from public.ssn where name='\"+name+\"';\"}"
            - trust_all_roots: 'true'
            - key: key
        publish:
          - ssn: '${return_result}'
        navigate:
          - HAS_MORE:
              next_step: SUCCESS
              ROI: '2'
          - NO_MORE:
              next_step: SUCCESS
              ROI: '2'
          - FAILURE: on_failure
  outputs:
    - ssn: '${ssn}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      sql_query:
        x: 129
        'y': 126
        navigate:
          43bc3c11-dedf-516c-a58f-6a482efb6245:
            targetId: 6a1f3bb5-55f7-dbbb-0b9b-3911d0722448
            port: NO_MORE
          ca0f33cb-9289-6973-64b8-2658cde5bd25:
            targetId: 6a1f3bb5-55f7-dbbb-0b9b-3911d0722448
            port: HAS_MORE
    results:
      SUCCESS:
        6a1f3bb5-55f7-dbbb-0b9b-3911d0722448:
          x: 369
          'y': 122
