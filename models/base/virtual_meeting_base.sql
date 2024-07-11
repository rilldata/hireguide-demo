select
      * 
    exclude (
      created_at,
      updated_at,
      end_time_utc,
      start_time_utc,
      recording_end_time_utc,
      recording_start_time_utc
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
        WHEN end_time_utc = 'None' THEN NULL
        ELSE CAST(end_time_utc AS TIMESTAMP)
    END AS end_time_utc,
    CASE 
        WHEN start_time_utc = 'None' THEN NULL
        ELSE CAST(start_time_utc AS TIMESTAMP)
    END AS start_time_utc,
    CASE 
        WHEN recording_end_time_utc = 'None' THEN NULL
        ELSE CAST(recording_end_time_utc AS TIMESTAMP)
    END AS recording_end_time_utc,
    CASE 
        WHEN recording_start_time_utc = 'None' THEN NULL
        ELSE CAST(recording_start_time_utc AS TIMESTAMP)
    END AS recording_start_time_utc
from virtual_meeting