
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "VW_SESSION_OVERVIEW" ("ID", "SESSION_CODE", "COURSE_ID", "COURSE_CODE", "COURSE_TITLE", "CATEGORY_CODE", "LEVEL_CODE", "START_DATE", "END_DATE", "CAPACITY", "LOCATION", "STATUS_CODE", "ENROLLMENT_COUNT", "AVAILABLE_SEATS", "TRAINER_COUNT", "TRAINER_NAMES", "CREATED_AT", "UPDATED_AT", "PERIOD", "PERIOD_BUCKET", "MEETING_COUNT") AS
  SELECT
    s.id,
    s.session_code,
    s.course_id,

    c.code              AS course_code,
    c.title             AS course_title,
    c.category_code,
    c.level_code,

    s.start_date,
    s.end_date,
    s.capacity,
    s.location,
    s.status_code,

    NVL(e.enrollment_count, 0) AS enrollment_count,

    CASE
        WHEN s.capacity IS NOT NULL
        THEN s.capacity - NVL(e.enrollment_count, 0)
    END AS available_seats,

    NVL(t.trainer_count, 0) AS trainer_count,

    t.trainer_names,

    s.created_at,
    s.updated_at,

    to_char(s.start_date, 'DD Mon YYYY')
        || ' â†’ ' ||
    to_char(s.end_date, 'DD Mon YYYY') AS period,

    CASE
        WHEN s.end_date < TRUNC(SYSDATE)
            THEN 'PAST'

        WHEN s.start_date <= TRUNC(SYSDATE)
         AND s.end_date   >= TRUNC(SYSDATE)
            THEN 'CURRENT'

        WHEN s.start_date <= TRUNC(SYSDATE) + 30
            THEN 'NEXT_30'

        WHEN s.start_date <= TRUNC(SYSDATE) + 90
            THEN 'NEXT_90'

        ELSE 'LATER'
    END AS period_bucket,
    NVL(m.meeting_count, 0) AS meeting_count

FROM training_session s

JOIN course c
    ON c.id = s.course_id

LEFT JOIN (
    SELECT
        session_id,
        COUNT(*) AS enrollment_count
    FROM enrollment
    WHERE status_code <> 'CANCELLED'
    GROUP BY session_id
) e
    ON e.session_id = s.id

LEFT JOIN (
    SELECT
        st.session_id,
        COUNT(*) AS trainer_count,

        LISTAGG(
            t.first_name || ' ' || t.last_name,
            ', '
        ) WITHIN GROUP (
            ORDER BY
                CASE st.role_code
                    WHEN 'LEAD' THEN 1
                    WHEN 'TRAINER' THEN 2
                    WHEN 'ASSISTANT' THEN 3
                    WHEN 'GUEST' THEN 4
                    ELSE 5
                END,
                t.last_name,
                t.first_name
        ) AS trainer_names

    FROM session_trainer st

    JOIN trainer t
        ON t.id = st.trainer_id

    GROUP BY st.session_id
) t
    ON t.session_id = s.id
    LEFT JOIN (
    SELECT
        session_id,
        COUNT(*) AS meeting_count
    FROM session_meeting
    GROUP BY session_id
) m
    ON m.session_id = s.id;

