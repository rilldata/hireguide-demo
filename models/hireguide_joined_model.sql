-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models

select * 
from view_meeting_utterances_and_ml_predictions vmuml
join view_interview_metadata vim
on vmuml.workspace_guid = vim.workspace_guid