select
      * 
    exclude (
      created_at,
      updated_at
    ),
    CASE 
        WHEN created_at = 'None' THEN NULL
        ELSE CAST(created_at AS TIMESTAMP)
    END AS created_at,
    CASE 
        WHEN updated_at = 'None' THEN NULL
        ELSE CAST(updated_at AS TIMESTAMP)
    END AS updated_at,
    guid as plan_guid
from plan