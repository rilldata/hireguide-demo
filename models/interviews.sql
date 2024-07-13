-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

with base as (
select 
  * 
from interview_base inter
--round
left join round_base round
on inter.round_guid = round.guid
-- candidate
left join candidate_base candi
on inter.candidate_guid = candi.guid
-- talent
left join talent_base tal
on candi.talent_guid = tal.guid
--plan
left join plan_base p
on round.plan_guid = p.guid
-- workspace
left join workspace_base w
on p.workspace_guid = w.guid
-- virtual meeting
left join virtual_meeting_base vm
on inter.guid = vm.interview_guid
left join script_base scr
on inter.guid = scr.interview_guid
)


select * from base