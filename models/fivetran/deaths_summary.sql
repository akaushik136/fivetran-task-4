-- models/deaths_summary.sql
select
    "Age Years",
    sum("Total deaths") as total_deaths,
    sum("COVID-19 Deaths") as covid_19_deaths
from {{ ref('pyraw') }}
group by "Age Years"
