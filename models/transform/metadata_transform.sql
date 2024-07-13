-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

select 
  *,
  date_diff('minutes', recording_start, recording_end) as recording_duration_minutes,
  date_diff('minutes', meeting_start, meeting_end) as meeting_duration_minutes,
  date_diff('hours', recording_start, recording_end) as recording_duration_hours,
  date_diff('hours', meeting_start, meeting_end) as meeting_duration_hours,
  CASE 
      WHEN meeting_start IS NOT NULL AND recording_start IS NULL THEN 1
      ELSE 0
  END AS meeting_without_recording_flag
from metadata_base
