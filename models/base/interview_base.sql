select
      * 
    exclude (
      created_at,
      webhook_updated_at,
      start_time
    ),
    CASE 
        WHEN created_at = 'None' THEN NULL
        ELSE CAST(created_at AS TIMESTAMP)
    END AS created_at,
    CASE 
        WHEN webhook_updated_at = 'None' THEN NULL
        ELSE CAST(webhook_updated_at AS TIMESTAMP)
    END AS webhook_updated_at,
    CASE 
        WHEN start_time = 'None' THEN NULL
        ELSE CAST(start_time AS TIMESTAMP)
    END AS start_time,
from interview