SELECT *
FROM {{ source('source', 'raw_json') }}