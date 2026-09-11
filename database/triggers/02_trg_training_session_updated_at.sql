
  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_TRAINING_SESSION_UPDATED_AT"
before update on training_session
for each row
begin
    :new.updated_at := systimestamp;
end;
/
ALTER TRIGGER "TRG_TRAINING_SESSION_UPDATED_AT" ENABLE;

