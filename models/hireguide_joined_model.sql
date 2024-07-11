-- Model SQL
-- Reference documentation: https://docs.rilldata.com/reference/project-files/models
-- @materialize: true

select 
  *
from metadata_transform vim
join view_meeting_utterances_and_ml_predictions vmuml
on vmuml.meeting_guid = vim.meeting_guid

