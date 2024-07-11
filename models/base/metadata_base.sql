-- @materialize: true
  
  select 
    * 
    exclude (
      recording_end_time_utc,
      recording_start_time_utc,
      scheduled_end_time_utc,
      scheduled_start_time_utc
    ),
    CASE 
        WHEN recording_start_time_utc = 'None' THEN NULL
        ELSE CAST(recording_start_time_utc AS TIMESTAMP)
    END AS recording_start,
    CASE 
        WHEN recording_end_time_utc = 'None' THEN NULL
        ELSE CAST(recording_end_time_utc AS TIMESTAMP)
    END AS recording_end,
    CASE 
        WHEN scheduled_start_time_utc = 'None' THEN NULL
        ELSE CAST(scheduled_start_time_utc AS TIMESTAMP)
    END AS meeting_start,
    CASE 
        WHEN scheduled_end_time_utc = 'None' THEN NULL
        ELSE CAST(scheduled_end_time_utc AS TIMESTAMP)
    END AS meeting_end
  from view_interview_metadata