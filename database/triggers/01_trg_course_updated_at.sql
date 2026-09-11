
  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_COURSE_UPDATED_AT"
before update on course
for each row
begin
    :new.updated_at := systimestamp;
end;
/
ALTER TRIGGER "TRG_COURSE_UPDATED_AT" ENABLE;

