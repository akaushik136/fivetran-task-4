-- models/metadata.sql
select
    "created_at",
    "created_meta",
    "updated_at",
    "updated_meta",
    "meta"
from {{ ref('pyraw') }}
