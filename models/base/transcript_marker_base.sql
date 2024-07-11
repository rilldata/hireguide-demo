select
      * 
    exclude (
      created_at
    ),
    CASE 
        WHEN created_at = 'None' THEN NULL
        ELSE CAST(created_at AS TIMESTAMP)
    END AS created_at
from transcript_marker