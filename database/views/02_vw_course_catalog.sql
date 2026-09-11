
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "VW_COURSE_CATALOG" ("ID", "CODE", "TITLE", "DESCRIPTION", "CATEGORY_CODE", "LEVEL_CODE", "DURATION_HOURS", "STATUS_CODE", "COURSE_MEDIA", "SESSION_COUNT", "UPCOMING_SESSION_COUNT", "NEXT_SESSION_DATE", "CREATED_AT", "UPDATED_AT") AS
  SELECT
    c.id,
    c.code,
    c.title,
    c.description,
    c.category_code,
    c.level_code,
    c.duration_hours,
    c.status_code,
    c.category_code
    || ' Â· '
    || c.level_code
    || ' Â· '
    || TO_CHAR(c.duration_hours)
    || ' h' AS course_meta,

    NVL(s.session_count, 0) AS session_count,
    NVL(s.upcoming_session_count, 0) AS upcoming_session_count,
    s.next_session_date,

    c.created_at,
    c.updated_at

FROM course c

LEFT JOIN (
    SELECT
        course_id,

        COUNT(*) AS session_count,

        COUNT(
            CASE
                WHEN start_date >= TRUNC(SYSDATE)
                 AND status_code IN ('PLANNED', 'OPEN')
                THEN 1
            END
        ) AS upcoming_session_count,

        MIN(
            CASE
                WHEN start_date >= TRUNC(SYSDATE)
                 AND status_code IN ('PLANNED', 'OPEN')
                THEN start_date
            END
        ) AS next_session_date

    FROM training_session
    GROUP BY course_id
) s
    ON s.course_id = c.id;

