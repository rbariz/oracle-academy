-- =====================================================================
-- Oracle Academy
-- seed_all.sql - V2
--
-- Clean -> Load -> Commit -> Verify
--
-- Portable design:
--   - No SET commands
--   - No substitution-sensitive '&' characters
--   - No direct SQL calls to local PL/SQL functions
--   - No hard-coded generated IDs
--   - Relationships resolved through business keys
--   - Relative dates for time-sensitive scenarios
-- =====================================================================

declare

    --------------------------------------------------------------------
    -- LOOKUP FUNCTIONS
    -- Called only from PL/SQL procedural code.
    --------------------------------------------------------------------

    function get_course_id(p_code varchar2)
        return number
    is
        l_id number;
    begin
        select id
          into l_id
          from course
         where code = p_code;

        return l_id;
    end;


    function get_session_id(p_code varchar2)
        return number
    is
        l_id number;
    begin
        select id
          into l_id
          from training_session
         where session_code = p_code;

        return l_id;
    end;


    function get_trainer_id(p_email varchar2)
        return number
    is
        l_id number;
    begin
        select id
          into l_id
          from trainer
         where email = p_email;

        return l_id;
    end;


    function get_participant_id(p_email varchar2)
        return number
    is
        l_id number;
    begin
        select id
          into l_id
          from participant
         where email = p_email;

        return l_id;
    end;


    function get_enrollment_id(
        p_session_code      varchar2,
        p_participant_email varchar2
    )
        return number
    is
        l_id number;
    begin
        select e.id
          into l_id
          from enrollment e
          join training_session s
            on s.id = e.session_id
          join participant p
            on p.id = e.participant_id
         where s.session_code = p_session_code
           and p.email = p_participant_email;

        return l_id;
    end;


    function get_meeting_id(
        p_session_code varchar2,
        p_topic        varchar2
    )
        return number
    is
        l_id number;
    begin
        select m.id
          into l_id
          from session_meeting m
          join training_session s
            on s.id = m.session_id
         where s.session_code = p_session_code
           and m.topic = p_topic;

        return l_id;
    end;


    --------------------------------------------------------------------
    -- INSERT HELPERS
    --------------------------------------------------------------------

    procedure add_session(
        p_course_code  varchar2,
        p_session_code varchar2,
        p_start_date   date,
        p_end_date     date,
        p_capacity     number,
        p_location     varchar2,
        p_status       varchar2
    )
    is
        l_course_id number;
    begin
        l_course_id := get_course_id(p_course_code);

        insert into training_session (
            course_id,
            session_code,
            start_date,
            end_date,
            capacity,
            location,
            status_code
        )
        values (
            l_course_id,
            p_session_code,
            p_start_date,
            p_end_date,
            p_capacity,
            p_location,
            p_status
        );
    end;


    procedure add_session_trainer(
        p_session_code varchar2,
        p_trainer_email varchar2,
        p_role          varchar2
    )
    is
        l_session_id number;
        l_trainer_id number;
    begin
        l_session_id := get_session_id(p_session_code);
        l_trainer_id := get_trainer_id(p_trainer_email);

        insert into session_trainer (
            session_id,
            trainer_id,
            role_code
        )
        values (
            l_session_id,
            l_trainer_id,
            p_role
        );
    end;


    procedure add_meeting(
        p_session_code varchar2,
        p_start_offset number,
        p_end_offset   number,
        p_topic        varchar2,
        p_room         varchar2
    )
    is
        l_session_id number;
    begin
        l_session_id := get_session_id(p_session_code);

        insert into session_meeting (
            session_id,
            starts_at,
            ends_at,
            topic,
            room_name
        )
        values (
            l_session_id,
            cast(trunc(sysdate) + p_start_offset as timestamp),
            cast(trunc(sysdate) + p_end_offset   as timestamp),
            p_topic,
            p_room
        );
    end;


    procedure add_enrollment(
        p_session_code varchar2,
        p_email        varchar2,
        p_status       varchar2
    )
    is
        l_session_id     number;
        l_participant_id number;
    begin
        l_session_id     := get_session_id(p_session_code);
        l_participant_id := get_participant_id(p_email);

        insert into enrollment (
            session_id,
            participant_id,
            enrolled_at,
            status_code
        )
        values (
            l_session_id,
            l_participant_id,
            systimestamp,
            p_status
        );
    end;


    procedure add_attendance(
        p_session_code varchar2,
        p_topic        varchar2,
        p_email        varchar2,
        p_status       varchar2,
        p_comments     varchar2 default null
    )
    is
        l_meeting_id    number;
        l_enrollment_id number;
    begin
        l_meeting_id :=
            get_meeting_id(p_session_code, p_topic);

        l_enrollment_id :=
            get_enrollment_id(p_session_code, p_email);

        insert into attendance (
            meeting_id,
            enrollment_id,
            status_code,
            comments
        )
        values (
            l_meeting_id,
            l_enrollment_id,
            p_status,
            p_comments
        );
    end;


    procedure add_assessment(
        p_session_code varchar2,
        p_email        varchar2,
        p_type         varchar2,
        p_date_offset  number,
        p_score        number,
        p_comments     varchar2 default null
    )
    is
        l_enrollment_id number;
    begin
        l_enrollment_id :=
            get_enrollment_id(p_session_code, p_email);

        insert into assessment (
            enrollment_id,
            assessment_type,
            assessment_date,
            score,
            comments
        )
        values (
            l_enrollment_id,
            p_type,
            trunc(sysdate) + p_date_offset,
            p_score,
            p_comments
        );
    end;


    procedure add_certification(
        p_session_code      varchar2,
        p_email             varchar2,
        p_certificate_no    varchar2,
        p_version           number,
        p_issued_offset     number,
        p_revoked_offset    number,
        p_status            varchar2
    )
    is
        l_enrollment_id number;
        l_revoked_at    date;
    begin
        l_enrollment_id :=
            get_enrollment_id(p_session_code, p_email);

        if p_revoked_offset is null then
            l_revoked_at := null;
        else
            l_revoked_at := trunc(sysdate) + p_revoked_offset;
        end if;

        insert into certification (
            enrollment_id,
            certificate_number,
            version_no,
            issued_at,
            revoked_at,
            status_code
        )
        values (
            l_enrollment_id,
            p_certificate_no,
            p_version,
            trunc(sysdate) + p_issued_offset,
            l_revoked_at,
            p_status
        );
    end;


begin

    dbms_output.put_line('Oracle Academy seed started.');


    --------------------------------------------------------------------
    -- 0. CLEAN
    --------------------------------------------------------------------

    delete from certification;
    delete from assessment;
    delete from attendance;
    delete from enrollment;
    delete from session_meeting;
    delete from session_trainer;
    delete from participant;
    delete from training_session;
    delete from trainer;
    delete from course;


    --------------------------------------------------------------------
    -- 1. TRAINERS
    --------------------------------------------------------------------

    insert into trainer
        (first_name, last_name, email, phone, specialty, status_code)
    values
        ('Youssef', 'Amrani', 'youssef.amrani@academy.demo',
         '+212600000101', 'Oracle SQL and PL/SQL', 'ACTIVE');

    insert into trainer
        (first_name, last_name, email, phone, specialty, status_code)
    values
        ('Sara', 'Bennani', 'sara.bennani@academy.demo',
         '+212600000102', 'Oracle APEX', 'ACTIVE');

    insert into trainer
        (first_name, last_name, email, phone, specialty, status_code)
    values
        ('Karim', 'El Mansouri', 'karim.elmansouri@academy.demo',
         '+212600000103', 'Oracle Database Architecture', 'ACTIVE');

    insert into trainer
        (first_name, last_name, email, phone, specialty, status_code)
    values
        ('Nadia', 'Alaoui', 'nadia.alaoui@academy.demo',
         '+212600000104', 'ORDS and REST APIs', 'ACTIVE');

    insert into trainer
        (first_name, last_name, email, phone, specialty, status_code)
    values
        ('Omar', 'Tazi', 'omar.tazi@academy.demo',
         '+212600000105', 'SQL Performance', 'ACTIVE');

    insert into trainer
        (first_name, last_name, email, phone, specialty, status_code)
    values
        ('Salma', 'Idrissi', 'salma.idrissi@academy.demo',
         '+212600000106', 'Data Modeling', 'ACTIVE');

    insert into trainer
        (first_name, last_name, email, phone, specialty, status_code)
    values
        ('Mehdi', 'Chraibi', 'mehdi.chraibi@academy.demo',
         '+212600000107', 'Enterprise Architecture', 'ACTIVE');

    insert into trainer
        (first_name, last_name, email, phone, specialty, status_code)
    values
        ('Leila', 'Fassi', 'leila.fassi@academy.demo',
         null, 'Oracle Forms', 'INACTIVE');


    --------------------------------------------------------------------
    -- 2. COURSES
    --------------------------------------------------------------------

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('SQL-FND',
         'SQL Fundamentals',
         'Introduction to relational querying with Oracle SQL.',
         'DATABASE', 'BEGINNER', 24, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('PLSQL-FND',
         'PL/SQL Fundamentals',
         'Procedural programming and database business logic with PL/SQL.',
         'DATABASE', 'BEGINNER', 30, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('APEX-FND',
         'Oracle APEX Fundamentals',
         'Building database-centric web applications with Oracle APEX.',
         'APEX', 'BEGINNER', 30, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('APEX-ADV',
         'Advanced Oracle APEX',
         'Advanced APEX architecture, components and reusable patterns.',
         'APEX', 'ADVANCED', 36, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('ORDS-API',
         'ORDS and REST APIs',
         'Designing REST APIs over Oracle Database using ORDS.',
         'INTEGRATION', 'INTERMEDIATE', 24, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('DB-ARCH',
         'Oracle Database Architecture',
         'Oracle Database architecture and enterprise deployment concepts.',
         'DATABASE', 'ADVANCED', 30, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('PERF-SQL',
         'SQL Performance Tuning',
         'SQL execution plans, indexing and performance diagnostics.',
         'PERFORMANCE', 'ADVANCED', 24, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('DATA-MODEL',
         'Data Modeling',
         'Relational data modeling for enterprise information systems.',
         'ARCHITECTURE', 'INTERMEDIATE', 20, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('ENT-ARCH',
         'Enterprise Architecture Fundamentals',
         'Architecture principles for enterprise information systems.',
         'ARCHITECTURE', 'INTERMEDIATE', 24, 'ACTIVE');

    insert into course
        (code, title, description, category_code,
         level_code, duration_hours, status_code)
    values
        ('FORMS-LEGACY',
         'Oracle Forms Modernization',
         'Modernization strategies for legacy Oracle Forms applications.',
         'MODERNIZATION', 'INTERMEDIATE', 18, 'INACTIVE');


    --------------------------------------------------------------------
    -- 3. TRAINING SESSIONS
    --------------------------------------------------------------------

    add_session(
        'SQL-FND', 'SQL-FND-HIST',
        trunc(sysdate) - 120,
        trunc(sysdate) - 115,
        18, 'Casablanca - Lab A', 'COMPLETED');

    add_session(
        'APEX-ADV', 'APEX-ADV-HIST',
        trunc(sysdate) - 75,
        trunc(sysdate) - 70,
        12, 'Casablanca - Lab B', 'COMPLETED');

    add_session(
        'PLSQL-FND', 'PLSQL-CANCELLED',
        trunc(sysdate) - 40,
        trunc(sysdate) - 38,
        15, 'Rabat - Room 2', 'CANCELLED');

    add_session(
        'APEX-FND', 'APEX-FND-CURRENT',
        trunc(sysdate) - 2,
        trunc(sysdate) + 2,
        20, 'Casablanca - Lab A', 'IN_PROGRESS');

    add_session(
        'SQL-FND', 'SQL-FND-OPEN-NOW',
        trunc(sysdate),
        trunc(sysdate) + 3,
        20, 'Casablanca - Lab C', 'OPEN');

    add_session(
        'ORDS-API', 'ORDS-OPEN-10',
        trunc(sysdate) + 10,
        trunc(sysdate) + 12,
        12, 'Remote', 'OPEN');

    add_session(
        'APEX-FND', 'APEX-FND-FULL',
        trunc(sysdate) + 18,
        trunc(sysdate) + 22,
        10, 'Casablanca - Lab B', 'OPEN');

    add_session(
        'DATA-MODEL', 'DATA-MODEL-PLANNED',
        trunc(sysdate) + 25,
        trunc(sysdate) + 27,
        16, 'Rabat - Room 4', 'PLANNED');

    add_session(
        'DB-ARCH', 'DB-ARCH-NOTRAINER',
        trunc(sysdate) + 35,
        trunc(sysdate) + 38,
        14, 'Casablanca - Lab D', 'PLANNED');

    add_session(
        'PERF-SQL', 'PERF-SQL-NOMEETING',
        trunc(sysdate) + 50,
        trunc(sysdate) + 52,
        12, 'Casablanca - Lab C', 'PLANNED');

    add_session(
        'ENT-ARCH', 'ENT-ARCH-MULTI',
        trunc(sysdate) + 20,
        trunc(sysdate) + 24,
        18, 'Casablanca - Conference Room', 'OPEN');

    add_session(
        'APEX-ADV', 'APEX-ADV-MULTI',
        trunc(sysdate) + 28,
        trunc(sysdate) + 32,
        16, 'Remote', 'OPEN');

    add_session(
        'SQL-FND', 'SQL-FND-NEXT90',
        trunc(sysdate) + 60,
        trunc(sysdate) + 63,
        20, 'Rabat - Lab 1', 'PLANNED');

    add_session(
        'ORDS-API', 'ORDS-LATER',
        trunc(sysdate) + 120,
        trunc(sysdate) + 122,
        15, 'Remote', 'PLANNED');

    add_session(
        'DATA-MODEL', 'DATA-MODEL-NULLS',
        trunc(sysdate) + 15,
        trunc(sysdate) + 16,
        null, null, 'PLANNED');


    --------------------------------------------------------------------
    -- 4. SESSION TRAINERS
    --------------------------------------------------------------------

    add_session_trainer(
        'SQL-FND-HIST',
        'youssef.amrani@academy.demo',
        'LEAD');

    add_session_trainer(
        'APEX-ADV-HIST',
        'sara.bennani@academy.demo',
        'LEAD');

    add_session_trainer(
        'PLSQL-CANCELLED',
        'youssef.amrani@academy.demo',
        'TRAINER');

    add_session_trainer(
        'APEX-FND-CURRENT',
        'sara.bennani@academy.demo',
        'LEAD');

    add_session_trainer(
        'SQL-FND-OPEN-NOW',
        'youssef.amrani@academy.demo',
        'LEAD');

    add_session_trainer(
        'ORDS-OPEN-10',
        'nadia.alaoui@academy.demo',
        'LEAD');

    add_session_trainer(
        'APEX-FND-FULL',
        'sara.bennani@academy.demo',
        'LEAD');

    add_session_trainer(
        'DATA-MODEL-PLANNED',
        'salma.idrissi@academy.demo',
        'LEAD');

    -- DB-ARCH-NOTRAINER intentionally has no trainer.

    add_session_trainer(
        'PERF-SQL-NOMEETING',
        'omar.tazi@academy.demo',
        'LEAD');

    add_session_trainer(
        'ENT-ARCH-MULTI',
        'mehdi.chraibi@academy.demo',
        'LEAD');

    add_session_trainer(
        'ENT-ARCH-MULTI',
        'karim.elmansouri@academy.demo',
        'TRAINER');

    add_session_trainer(
        'ENT-ARCH-MULTI',
        'nadia.alaoui@academy.demo',
        'GUEST');

    add_session_trainer(
        'APEX-ADV-MULTI',
        'sara.bennani@academy.demo',
        'LEAD');

    add_session_trainer(
        'APEX-ADV-MULTI',
        'nadia.alaoui@academy.demo',
        'ASSISTANT');

    add_session_trainer(
        'SQL-FND-NEXT90',
        'youssef.amrani@academy.demo',
        'LEAD');

    add_session_trainer(
        'ORDS-LATER',
        'nadia.alaoui@academy.demo',
        'LEAD');


    --------------------------------------------------------------------
    -- 5. SESSION MEETINGS
    --
    -- Offsets include fractional days for the time:
    --   9/24  = 09:00
    --   12/24 = 12:00
    --   13/24 = 13:00
    --------------------------------------------------------------------

    add_meeting(
        'SQL-FND-HIST',
        -120 + 9/24, -120 + 12/24,
        'SQL Basics', 'Lab A');

    add_meeting(
        'SQL-FND-HIST',
        -118 + 9/24, -118 + 12/24,
        'Joins and Aggregation', 'Lab A');

    add_meeting(
        'SQL-FND-HIST',
        -116 + 9/24, -116 + 12/24,
        'Subqueries', 'Lab A');


    add_meeting(
        'APEX-ADV-HIST',
        -75 + 9/24, -75 + 13/24,
        'Advanced APEX Architecture', 'Lab B');

    add_meeting(
        'APEX-ADV-HIST',
        -72 + 9/24, -72 + 13/24,
        'APEX Security', 'Lab B');


    add_meeting(
        'PLSQL-CANCELLED',
        -40 + 9/24, -40 + 12/24,
        'PL/SQL Introduction', 'Room 2');


    add_meeting(
        'APEX-FND-CURRENT',
        -2 + 9/24, -2 + 12/24,
        'APEX Foundations', 'Lab A');

    add_meeting(
        'APEX-FND-CURRENT',
        9/24, 12/24,
        'Pages and Regions', 'Lab A');

    add_meeting(
        'APEX-FND-CURRENT',
        2 + 9/24, 2 + 12/24,
        'Forms and Processing', 'Lab A');


    add_meeting(
        'SQL-FND-OPEN-NOW',
        9/24, 12/24,
        'SQL Query Essentials', 'Lab C');

    add_meeting(
        'SQL-FND-OPEN-NOW',
        2 + 9/24, 2 + 12/24,
        'SQL Joins', 'Lab C');


    add_meeting(
        'ORDS-OPEN-10',
        10 + 9/24, 10 + 12/24,
        'REST Architecture', 'Remote');

    add_meeting(
        'ORDS-OPEN-10',
        11 + 9/24, 11 + 12/24,
        'ORDS Security', 'Remote');


    add_meeting(
        'APEX-FND-FULL',
        18 + 9/24, 18 + 12/24,
        'APEX Application Builder', 'Lab B');

    add_meeting(
        'APEX-FND-FULL',
        20 + 9/24, 20 + 12/24,
        'APEX Shared Components', 'Lab B');


    add_meeting(
        'DATA-MODEL-PLANNED',
        25 + 9/24, 25 + 12/24,
        'Conceptual Modeling', 'Room 4');


    -- Has meetings, deliberately no trainer.
    add_meeting(
        'DB-ARCH-NOTRAINER',
        35 + 9/24, 35 + 12/24,
        'Oracle Instance Architecture', 'Lab D');


    -- PERF-SQL-NOMEETING intentionally has no meeting.


    add_meeting(
        'ENT-ARCH-MULTI',
        20 + 9/24, 20 + 12/24,
        'Architecture Foundations', 'Conference Room');

    add_meeting(
        'ENT-ARCH-MULTI',
        22 + 9/24, 22 + 12/24,
        'Integration Architecture', 'Conference Room');


    add_meeting(
        'APEX-ADV-MULTI',
        28 + 9/24, 28 + 12/24,
        'Reusable Components', 'Remote');

    add_meeting(
        'APEX-ADV-MULTI',
        29 + 9/24, 29 + 12/24,
        'APEX Plug-ins', 'Remote');

    add_meeting(
        'APEX-ADV-MULTI',
        30 + 9/24, 30 + 12/24,
        'Security and Authorization', 'Remote');

    add_meeting(
        'APEX-ADV-MULTI',
        31 + 9/24, 31 + 12/24,
        'Deployment Patterns', 'Remote');

    add_meeting(
        'APEX-ADV-MULTI',
        32 + 9/24, 32 + 12/24,
        'Final Workshop', 'Remote');


    add_meeting(
        'SQL-FND-NEXT90',
        60 + 9/24, 60 + 12/24,
        'SQL Fundamentals Workshop', 'Lab 1');

    add_meeting(
        'ORDS-LATER',
        120 + 9/24, 120 + 12/24,
        'ORDS API Design', 'Remote');

    add_meeting(
        'DATA-MODEL-NULLS',
        15 + 9/24, 15 + 12/24,
        'Logical Data Modeling', null);


    --------------------------------------------------------------------
    -- 6. PARTICIPANTS
    --------------------------------------------------------------------

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Amine', 'Berrada', 'amine.berrada@demo.ma',
         '+212611000001', 'Atlas Digital', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Imane', 'Zahraoui', 'imane.zahraoui@demo.ma',
         '+212611000002', 'Nova Systems', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Hamza', 'Lahlou', 'hamza.lahlou@demo.ma',
         '+212611000003', 'Atlas Digital', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Meryem', 'Saidi', 'meryem.saidi@demo.ma',
         '+212611000004', 'Maghreb Tech', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Anas', 'Filali', 'anas.filali@demo.ma',
         '+212611000005', 'Nova Systems', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Ghita', 'Benjelloun', 'ghita.benjelloun@demo.ma',
         '+212611000006', 'Cloud Factory', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Ayoub', 'Mernissi', 'ayoub.mernissi@demo.ma',
         '+212611000007', 'DataWorks', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Hajar', 'Kabbaj', 'hajar.kabbaj@demo.ma',
         '+212611000008', 'Cloud Factory', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Adam', 'Lamrani', 'adam.lamrani@demo.ma',
         '+212611000009', 'DataWorks', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Sofia', 'Ait Ali', 'sofia.aitali@demo.ma',
         '+212611000010', 'Atlas Digital', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Othmane', 'Bennis', 'othmane.bennis@demo.ma',
         '+212611000011', 'Maghreb Tech', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Lina', 'El Fassi', 'lina.elfassi@demo.ma',
         '+212611000012', 'Nova Systems', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Zakaria', 'Naciri', 'zakaria.naciri@demo.ma',
         '+212611000013', 'Cloud Factory', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Aya', 'Chakir', 'aya.chakir@demo.ma',
         '+212611000014', 'DataWorks', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Yassine', 'Bouzid', 'yassine.bouzid@demo.ma',
         '+212611000015', 'Atlas Digital', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Nour', 'Jalal', 'nour.jalal@demo.ma',
         '+212611000016', 'Nova Systems', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Ilyas', 'Rami', 'ilyas.rami@demo.ma',
         '+212611000017', 'Maghreb Tech', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Kenza', 'Raji', 'kenza.raji@demo.ma',
         '+212611000018', 'Cloud Factory', 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Reda', 'Hakim', 'reda.hakim@demo.ma',
         null, null, 'ACTIVE');

    insert into participant
        (first_name, last_name, email, phone, organization, status_code)
    values
        ('Samira', 'Mouline', 'samira.mouline@demo.ma',
         null, 'Legacy Corp', 'INACTIVE');


    --------------------------------------------------------------------
    -- 7. ENROLLMENTS
    --------------------------------------------------------------------

    -- Historical SQL
    add_enrollment('SQL-FND-HIST', 'amine.berrada@demo.ma', 'COMPLETED');
    add_enrollment('SQL-FND-HIST', 'imane.zahraoui@demo.ma', 'COMPLETED');
    add_enrollment('SQL-FND-HIST', 'hamza.lahlou@demo.ma', 'COMPLETED');
    add_enrollment('SQL-FND-HIST', 'meryem.saidi@demo.ma', 'COMPLETED');
    add_enrollment('SQL-FND-HIST', 'anas.filali@demo.ma', 'FAILED');
    add_enrollment('SQL-FND-HIST', 'ghita.benjelloun@demo.ma', 'COMPLETED');

    -- Historical Advanced APEX
    add_enrollment('APEX-ADV-HIST', 'ayoub.mernissi@demo.ma', 'COMPLETED');
    add_enrollment('APEX-ADV-HIST', 'hajar.kabbaj@demo.ma', 'COMPLETED');
    add_enrollment('APEX-ADV-HIST', 'adam.lamrani@demo.ma', 'COMPLETED');
    add_enrollment('APEX-ADV-HIST', 'sofia.aitali@demo.ma', 'COMPLETED');
    add_enrollment('APEX-ADV-HIST', 'othmane.bennis@demo.ma', 'FAILED');
    add_enrollment('APEX-ADV-HIST', 'lina.elfassi@demo.ma', 'COMPLETED');

    -- Cancelled session
    add_enrollment('PLSQL-CANCELLED', 'zakaria.naciri@demo.ma', 'CANCELLED');
    add_enrollment('PLSQL-CANCELLED', 'aya.chakir@demo.ma', 'CANCELLED');

    -- Current
    add_enrollment('APEX-FND-CURRENT', 'amine.berrada@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-CURRENT', 'hamza.lahlou@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-CURRENT', 'anas.filali@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-CURRENT', 'ayoub.mernissi@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-CURRENT', 'adam.lamrani@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-CURRENT', 'othmane.bennis@demo.ma', 'ENROLLED');

    -- Open SQL
    add_enrollment('SQL-FND-OPEN-NOW', 'imane.zahraoui@demo.ma', 'CONFIRMED');
    add_enrollment('SQL-FND-OPEN-NOW', 'meryem.saidi@demo.ma', 'CONFIRMED');
    add_enrollment('SQL-FND-OPEN-NOW', 'ghita.benjelloun@demo.ma', 'ENROLLED');
    add_enrollment('SQL-FND-OPEN-NOW', 'hajar.kabbaj@demo.ma', 'ENROLLED');

    -- ORDS: deliberately 11 / 12
    add_enrollment('ORDS-OPEN-10', 'amine.berrada@demo.ma', 'CONFIRMED');
    add_enrollment('ORDS-OPEN-10', 'imane.zahraoui@demo.ma', 'CONFIRMED');
    add_enrollment('ORDS-OPEN-10', 'hamza.lahlou@demo.ma', 'CONFIRMED');
    add_enrollment('ORDS-OPEN-10', 'meryem.saidi@demo.ma', 'CONFIRMED');
    add_enrollment('ORDS-OPEN-10', 'anas.filali@demo.ma', 'CONFIRMED');
    add_enrollment('ORDS-OPEN-10', 'ghita.benjelloun@demo.ma', 'CONFIRMED');
    add_enrollment('ORDS-OPEN-10', 'ayoub.mernissi@demo.ma', 'CONFIRMED');
    add_enrollment('ORDS-OPEN-10', 'hajar.kabbaj@demo.ma', 'CONFIRMED');
    add_enrollment('ORDS-OPEN-10', 'adam.lamrani@demo.ma', 'ENROLLED');
    add_enrollment('ORDS-OPEN-10', 'sofia.aitali@demo.ma', 'ENROLLED');
    add_enrollment('ORDS-OPEN-10', 'othmane.bennis@demo.ma', 'ENROLLED');

    -- APEX: deliberately full, 10 / 10
    add_enrollment('APEX-FND-FULL', 'othmane.bennis@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'lina.elfassi@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'zakaria.naciri@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'aya.chakir@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'yassine.bouzid@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'nour.jalal@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'ilyas.rami@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'kenza.raji@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'reda.hakim@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-FND-FULL', 'samira.mouline@demo.ma', 'CONFIRMED');

    -- Multi-trainer
    add_enrollment('ENT-ARCH-MULTI', 'amine.berrada@demo.ma', 'CONFIRMED');
    add_enrollment('ENT-ARCH-MULTI', 'lina.elfassi@demo.ma', 'ENROLLED');
    add_enrollment('ENT-ARCH-MULTI', 'zakaria.naciri@demo.ma', 'ENROLLED');

    -- Multi-meeting
    add_enrollment('APEX-ADV-MULTI', 'aya.chakir@demo.ma', 'CONFIRMED');
    add_enrollment('APEX-ADV-MULTI', 'yassine.bouzid@demo.ma', 'ENROLLED');


    --------------------------------------------------------------------
    -- 8. ATTENDANCE
    --------------------------------------------------------------------

    add_attendance(
        'SQL-FND-HIST', 'SQL Basics',
        'amine.berrada@demo.ma', 'PRESENT');

    add_attendance(
        'SQL-FND-HIST', 'SQL Basics',
        'imane.zahraoui@demo.ma', 'PRESENT');

    add_attendance(
        'SQL-FND-HIST', 'SQL Basics',
        'hamza.lahlou@demo.ma', 'LATE');

    add_attendance(
        'SQL-FND-HIST', 'SQL Basics',
        'meryem.saidi@demo.ma', 'PRESENT');

    add_attendance(
        'SQL-FND-HIST', 'Joins and Aggregation',
        'amine.berrada@demo.ma', 'PRESENT');

    add_attendance(
        'SQL-FND-HIST', 'Joins and Aggregation',
        'imane.zahraoui@demo.ma', 'ABSENT',
        'Unavailable');

    add_attendance(
        'SQL-FND-HIST', 'Joins and Aggregation',
        'hamza.lahlou@demo.ma', 'PRESENT');

    add_attendance(
        'SQL-FND-HIST', 'Subqueries',
        'amine.berrada@demo.ma', 'PRESENT');

    add_attendance(
        'SQL-FND-HIST', 'Subqueries',
        'imane.zahraoui@demo.ma', 'EXCUSED');


    add_attendance(
        'APEX-ADV-HIST', 'Advanced APEX Architecture',
        'ayoub.mernissi@demo.ma', 'PRESENT');

    add_attendance(
        'APEX-ADV-HIST', 'Advanced APEX Architecture',
        'hajar.kabbaj@demo.ma', 'PRESENT');

    add_attendance(
        'APEX-ADV-HIST', 'Advanced APEX Architecture',
        'adam.lamrani@demo.ma', 'LATE');

    add_attendance(
        'APEX-ADV-HIST', 'APEX Security',
        'ayoub.mernissi@demo.ma', 'PRESENT');

    add_attendance(
        'APEX-ADV-HIST', 'APEX Security',
        'hajar.kabbaj@demo.ma', 'PRESENT');


    add_attendance(
        'APEX-FND-CURRENT', 'APEX Foundations',
        'amine.berrada@demo.ma', 'PRESENT');

    add_attendance(
        'APEX-FND-CURRENT', 'APEX Foundations',
        'hamza.lahlou@demo.ma', 'PRESENT');

    add_attendance(
        'APEX-FND-CURRENT', 'APEX Foundations',
        'anas.filali@demo.ma', 'ABSENT');

    add_attendance(
        'APEX-FND-CURRENT', 'APEX Foundations',
        'ayoub.mernissi@demo.ma', 'LATE');

    add_attendance(
        'APEX-FND-CURRENT', 'Pages and Regions',
        'amine.berrada@demo.ma', 'PRESENT');

    add_attendance(
        'APEX-FND-CURRENT', 'Pages and Regions',
        'hamza.lahlou@demo.ma', 'PRESENT');


    --------------------------------------------------------------------
    -- 9. ASSESSMENTS
    --------------------------------------------------------------------

    add_assessment(
        'SQL-FND-HIST',
        'amine.berrada@demo.ma',
        'FINAL', -115, 92,
        'Excellent understanding of SQL fundamentals.');

    add_assessment(
        'SQL-FND-HIST',
        'imane.zahraoui@demo.ma',
        'FINAL', -115, 84);

    add_assessment(
        'SQL-FND-HIST',
        'hamza.lahlou@demo.ma',
        'PRACTICAL', -116, 78,
        'Good practical work.');

    add_assessment(
        'SQL-FND-HIST',
        'anas.filali@demo.ma',
        'FINAL', -115, 48,
        'Additional practice recommended.');


    add_assessment(
        'APEX-ADV-HIST',
        'ayoub.mernissi@demo.ma',
        'QUIZ', -74, 88);

    add_assessment(
        'APEX-ADV-HIST',
        'ayoub.mernissi@demo.ma',
        'FINAL', -70, 94,
        'Excellent final project.');

    add_assessment(
        'APEX-ADV-HIST',
        'hajar.kabbaj@demo.ma',
        'PRACTICAL', -72, 86);

    add_assessment(
        'APEX-ADV-HIST',
        'hajar.kabbaj@demo.ma',
        'FINAL', -70, 90,
        'Strong APEX implementation.');

    add_assessment(
        'APEX-ADV-HIST',
        'adam.lamrani@demo.ma',
        'FINAL', -70, 82);

    add_assessment(
        'APEX-ADV-HIST',
        'sofia.aitali@demo.ma',
        'FINAL', -70, 77);

    add_assessment(
        'APEX-ADV-HIST',
        'othmane.bennis@demo.ma',
        'FINAL', -70, 42,
        'Final objectives not reached.');


    --------------------------------------------------------------------
    -- 10. CERTIFICATIONS
    --------------------------------------------------------------------

    add_certification(
        'SQL-FND-HIST',
        'amine.berrada@demo.ma',
        'CERT-SQL-001',
        1, -114, null, 'ISSUED');

    add_certification(
        'SQL-FND-HIST',
        'imane.zahraoui@demo.ma',
        'CERT-SQL-002',
        1, -114, null, 'ISSUED');

    add_certification(
        'APEX-ADV-HIST',
        'ayoub.mernissi@demo.ma',
        'CERT-APEX-001',
        1, -69, null, 'ISSUED');

    add_certification(
        'APEX-ADV-HIST',
        'hajar.kabbaj@demo.ma',
        'CERT-APEX-002',
        1, -69, null, 'ISSUED');

    -- Certification version history
    add_certification(
        'APEX-ADV-HIST',
        'adam.lamrani@demo.ma',
        'CERT-APEX-003-V1',
        1, -69, -60, 'REVOKED');

    add_certification(
        'APEX-ADV-HIST',
        'adam.lamrani@demo.ma',
        'CERT-APEX-003-V2',
        2, -59, null, 'ISSUED');


    --------------------------------------------------------------------
    -- 11. COMMIT
    --------------------------------------------------------------------

    commit;

    dbms_output.put_line(
        'Oracle Academy seed completed successfully.'
    );


exception
    when others then

        rollback;

        dbms_output.put_line(
            'Oracle Academy seed FAILED: ' || sqlerrm
        );

        raise;
end;
/