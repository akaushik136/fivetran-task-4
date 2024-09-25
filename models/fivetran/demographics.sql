-- models/demographics.sql
select
    "id",
    "Sex",
    "Age Years",
    "created_at"
from {{ ref('pyraw') }}
where "Sex" is not null and "Age Years" is not null
