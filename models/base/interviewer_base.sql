with base as (
select
      * 
    exclude (
      created_at,
      updated_at,
      is_submitted
    ),
    CASE 
        WHEN created_at = 'None' THEN NULL
        ELSE CAST(created_at AS TIMESTAMP)
    END AS created_at,
    CASE 
        WHEN updated_at = 'None' THEN NULL
        ELSE CAST(updated_at AS TIMESTAMP)
    END AS updated_at,
    CASE 
        WHEN is_submitted = '1.0' THEN true
        WHEN is_submitted = '0.0' THEN false
        ELSE null
    END AS is_submitted
from interviewer
)

select 
  *,
  CASE 
    WHEN is_submitted = true THEN date_diff('minutes', created_at, updated_at)
    ELSE null
  END AS time_to_submit_feedback_minutes
from base