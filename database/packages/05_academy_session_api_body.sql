
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACADEMY_SESSION_API" as

    function can_delete_session (
        p_session_id in training_session.id%type
    ) return boolean
    is
        l_status_code       training_session.status_code%type;
        l_enrollment_count  number;
        l_meeting_count     number;
        l_trainer_count     number;
    begin
        select status_code,
               enrollment_count,
               meeting_count,
               trainer_count
          into l_status_code,
               l_enrollment_count,
               l_meeting_count,
               l_trainer_count
          from vw_session_overview
         where id = p_session_id;

        return
               l_status_code = 'PLANNED'
           and l_enrollment_count = 0
           and l_meeting_count = 0
           and l_trainer_count = 0;

    exception
        when no_data_found then
            return false;
    end can_delete_session;

    procedure delete_session (
    p_session_id in training_session.id%type
)
is
begin
    if not can_delete_session(p_session_id) then
        raise_application_error(
            -20001,
            'Training session cannot be deleted.'
        );
    end if;

    delete from training_session
     where id = p_session_id;

    if sql%rowcount = 0 then
        raise_application_error(
            -20002,
            'Training session not found.'
        );
    end if;
end delete_session;

end academy_session_api;
/

