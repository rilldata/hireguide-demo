-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

with base as (
select 
  * 
from metadata_transform meta

--interview
left join interview_base inter
on meta.interview_guid = inter.guid

-- meeting
left join virtual_meeting_base vir
on inter.guid = vir.interview_guid

-- plan
left join plan_base p
on meta.plan_guid = p.guid

-- round
left join round_base r
on meta.round_guid = r.guid

-- workspace
left join workspace_base w
on meta.workspace_guid = w.guid

-- participant
left join participant_base as par
on meta.meeting_guid = par.meeting_guid
and par.type = 'CANDIDATE'

-- candidate
left join candidate_base candi
on inter.candidate_guid = candi.guid

-- talent
left join talent_base tal
on candi.talent_guid = tal.guid

)



select 
  *,
  interview_guid,
  workspace_guid,
  interview_title,
  interview_is_archived,
  round_title,
  plan_title,
  plan_is_archived,
  workspace_name,
  recording_start,
  recording_end,
  meeting_start,
  meeting_end,
  meeting_duration_minutes,
  meeting_without_recording_flag,
  recording_duration_minutes,
  status as interview_status,
  candidate_status,
  source,
  title,
  type,
  is_recorded,
  is_recorded_toggle_method,
  ats_type,
  description_1 as round_description,
  employment_type,
  job_posting_url,
  participant_guid,
  role_guid,
  virtual_meeting_guid,
  full_name as talent_name
  
from base