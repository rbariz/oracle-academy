
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "VW_SESSION_CALENDAR" ("MEETING_ID", "SESSION_ID", "SESSION_CODE", "SESSION_STATUS", "LOCATION", "COURSE_ID", "COURSE_CODE", "COURSE_TITLE", "CATEGORY_CODE", "LEVEL_CODE", "STARTS_AT", "ENDS_AT", "TOPIC", "ROOM_NAME", "CALENDAR_TITLE", "DISPLAY_LOCATION") AS
  SELECT
    m.id                  AS meeting_id,
    m.session_id,

    s.session_code,
    s.status_code         AS session_status,
    s.location,

    c.id                  AS course_id,
    c.code                AS course_code,
    c.title               AS course_title,
    c.category_code,
    c.level_code,

    m.starts_at,
    m.ends_at,
    m.topic,
    m.room_name,

    c.title ||
        CASE
            WHEN m.topic IS NOT NULL
            THEN ' â€” ' || m.topic
        END               AS calendar_title,

    CASE
        WHEN m.room_name IS NOT NULL
        THEN m.room_name
        ELSE s.location
    END                   AS display_location

FROM session_meeting m

JOIN training_session s
    ON s.id = m.session_id

JOIN course c
    ON c.id = s.course_id;

