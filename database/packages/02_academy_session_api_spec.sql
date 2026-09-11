
  CREATE OR REPLACE EDITIONABLE PACKAGE "ACADEMY_SESSION_API" as

    function can_delete_session (
        p_session_id in training_session.id%type
    ) return boolean;

    procedure delete_session (
    p_session_id in training_session.id%type
);

end academy_session_api;
/

