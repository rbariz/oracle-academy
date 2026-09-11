
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "VW_ENROLLMENT_PROGRESS" ("ENROLLMENT_ID", "SESSION_ID", "PARTICIPANT_ID", "ENROLLMENT_STATUS", "ENROLLED_AT", "FIRST_NAME", "LAST_NAME", "PARTICIPANT_NAME", "PARTICIPANT_EMAIL", "ORGANIZATION", "SESSION_CODE", "START_DATE", "END_DATE", "SESSION_STATUS", "COURSE_ID", "COURSE_CODE", "COURSE_TITLE", "MEETING_COUNT", "ATTENDANCE_RECORD_COUNT", "PRESENT_COUNT", "LATE_COUNT", "ABSENT_COUNT", "EXCUSED_COUNT", "ATTENDANCE_PCT", "ASSESSMENT_COUNT", "AVERAGE_SCORE", "FINAL_SCORE", "CERTIFICATE_NUMBER", "CERTIFICATE_VERSION", "CERTIFICATE_STATUS", "CERTIFICATE_ISSUED_AT", "CERTIFIED_FLAG", "CREATED_AT", "UPDATED_AT") AS
  SELECT
    e.id                    AS enrollment_id,
    e.session_id,
    e.participant_id,
    e.status_code           AS enrollment_status,
    e.enrolled_at,

    p.first_name,
    p.last_name,
    p.first_name || ' ' || p.last_name
                            AS participant_name,
    p.email                 AS participant_email,
    p.organization,

    s.session_code,
    s.start_date,
    s.end_date,
    s.status_code           AS session_status,

    c.id                    AS course_id,
    c.code                  AS course_code,
    c.title                 AS course_title,

    /* Attendance */
    NVL(m.meeting_count, 0)
                            AS meeting_count,

    NVL(a.attendance_record_count, 0)
                            AS attendance_record_count,

    NVL(a.present_count, 0)
                            AS present_count,

    NVL(a.late_count, 0)
                            AS late_count,

    NVL(a.absent_count, 0)
                            AS absent_count,

    NVL(a.excused_count, 0)
                            AS excused_count,

    CASE
        WHEN NVL(m.meeting_count, 0) = 0 THEN NULL
        ELSE ROUND(
            100 *
            NVL(a.attended_count, 0)
            / m.meeting_count,
            2
        )
    END                     AS attendance_pct,

    /* Assessments */
    NVL(sc.assessment_count, 0)
                            AS assessment_count,

    sc.average_score,

    sc.final_score,

    /* Certification */
    cert.certificate_number,
    cert.certificate_version,
    cert.certificate_status,
    cert.certificate_issued_at,

    CASE
        WHEN cert.certificate_number IS NOT NULL
        THEN 'YES'
        ELSE 'NO'
    END                     AS certified_flag,

    e.created_at,
    e.updated_at

FROM enrollment e

JOIN participant p
    ON p.id = e.participant_id

JOIN training_session s
    ON s.id = e.session_id

JOIN course c
    ON c.id = s.course_id


/* ============================================================
   Number of meetings in the training session
   ============================================================ */
LEFT JOIN (
    SELECT
        session_id,
        COUNT(*) AS meeting_count
    FROM session_meeting
    GROUP BY session_id
) m
    ON m.session_id = e.session_id


/* ============================================================
   Attendance aggregation by enrollment
   ============================================================ */
LEFT JOIN (
    SELECT
        enrollment_id,

        COUNT(*) AS attendance_record_count,

        SUM(
            CASE
                WHEN status_code = 'PRESENT' THEN 1
                ELSE 0
            END
        ) AS present_count,

        SUM(
            CASE
                WHEN status_code = 'LATE' THEN 1
                ELSE 0
            END
        ) AS late_count,

        SUM(
            CASE
                WHEN status_code = 'ABSENT' THEN 1
                ELSE 0
            END
        ) AS absent_count,

        SUM(
            CASE
                WHEN status_code = 'EXCUSED' THEN 1
                ELSE 0
            END
        ) AS excused_count,

        SUM(
            CASE
                WHEN status_code IN (
                    'PRESENT',
                    'LATE',
                    'EXCUSED'
                )
                THEN 1
                ELSE 0
            END
        ) AS attended_count

    FROM attendance
    GROUP BY enrollment_id
) a
    ON a.enrollment_id = e.id


/* ============================================================
   Assessment aggregation by enrollment
   ============================================================ */
LEFT JOIN (
    SELECT
        enrollment_id,

        COUNT(*) AS assessment_count,

        ROUND(
            AVG(score),
            2
        ) AS average_score,

        MAX(
            CASE
                WHEN assessment_type = 'FINAL'
                THEN score
            END
        ) AS final_score

    FROM assessment
    GROUP BY enrollment_id
) sc
    ON sc.enrollment_id = e.id


/* ============================================================
   Latest certification version by enrollment
   ============================================================ */
LEFT JOIN (
    SELECT
        enrollment_id,
        certificate_number,
        version_no          AS certificate_version,
        status_code         AS certificate_status,
        issued_at           AS certificate_issued_at

    FROM (
        SELECT
            c.*,

            ROW_NUMBER() OVER (
                PARTITION BY enrollment_id
                ORDER BY
                    version_no DESC,
                    issued_at DESC,
                    id DESC
            ) AS rn

        FROM certification c
    )

    WHERE rn = 1
) cert
    ON cert.enrollment_id = e.id;

