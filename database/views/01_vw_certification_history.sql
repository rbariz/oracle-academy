
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "VW_CERTIFICATION_HISTORY" ("CERTIFICATION_ID", "ENROLLMENT_ID", "CERTIFICATE_NUMBER", "VERSION_NO", "ISSUED_AT", "REVOKED_AT", "CERTIFICATE_STATUS", "PARTICIPANT_ID", "SESSION_ID", "FIRST_NAME", "LAST_NAME", "PARTICIPANT_NAME", "PARTICIPANT_EMAIL", "SESSION_CODE", "COURSE_ID", "COURSE_CODE", "COURSE_TITLE", "STATUS_LABEL") AS
  SELECT
    cert.id                     AS certification_id,
    cert.enrollment_id,

    cert.certificate_number,
    cert.version_no,
    cert.issued_at,
    cert.revoked_at,
    cert.status_code            AS certificate_status,

    e.participant_id,
    e.session_id,

    p.first_name,
    p.last_name,
    p.first_name || ' ' || p.last_name
                                AS participant_name,
    p.email                     AS participant_email,

    s.session_code,

    c.id                        AS course_id,
    c.code                      AS course_code,
    c.title                     AS course_title,

    CASE
        WHEN cert.status_code = 'ISSUED'
            THEN 'Valid'
        WHEN cert.status_code = 'REVOKED'
            THEN 'Revoked'
        ELSE cert.status_code
    END                         AS status_label

FROM certification cert

JOIN enrollment e
    ON e.id = cert.enrollment_id

JOIN participant p
    ON p.id = e.participant_id

JOIN training_session s
    ON s.id = e.session_id

JOIN course c
    ON c.id = s.course_id;

