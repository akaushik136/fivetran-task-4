-- models/time_series.sql
select
    "created_at",
    sum("Total deaths") as total_deaths,
    sum("COVID-19 Deaths") as covid_19_deaths
from {{ ref('pyraw') }}
group by "created_at"
order by "created_at"
