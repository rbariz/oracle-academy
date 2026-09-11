-- ============================================================
-- Oracle Academy
-- Database Core Deployment
-- SQLcl deployment driver
-- ============================================================

set sqlblanklines on
set define off
set echo on
set feedback on

whenever sqlerror exit sql.sqlcode rollback

prompt ============================================================
prompt Oracle Academy - Database Core Deployment
prompt ============================================================


prompt
prompt [1/7] TABLES
prompt ------------------------------------------------------------

@@ddl/01_course.sql
@@ddl/02_trainer.sql
@@ddl/03_participant.sql
@@ddl/04_training_session.sql
@@ddl/05_session_meeting.sql
@@ddl/06_session_trainer.sql
@@ddl/07_enrollment.sql
@@ddl/08_assessment.sql
@@ddl/09_certification.sql
@@ddl/10_attendance.sql


prompt
prompt [2/7] EXPLICIT INDEXES
prompt ------------------------------------------------------------

@@indexes/01_ix_session_course.sql
@@indexes/02_ix_meeting_session.sql
@@indexes/03_ix_st_trainer.sql
@@indexes/04_ix_enrollment_participant.sql
@@indexes/05_ix_assessment_enrollment.sql
@@indexes/06_ix_certification_enrollment.sql
@@indexes/07_ix_attendance_enrollment.sql


prompt
prompt [3/7] VIEWS
prompt ------------------------------------------------------------

@@views/01_vw_certification_history.sql
@@views/02_vw_course_catalog.sql
@@views/03_vw_enrollment_progress.sql
@@views/04_vw_session_calendar.sql
@@views/05_vw_session_overview.sql


prompt
prompt [4/7] PACKAGE SPECS
prompt ------------------------------------------------------------

@@packages/01_academy_number_stepper_plugin_spec.sql
@@packages/02_academy_session_api_spec.sql
@@packages/03_academy_ui_spec.sql


prompt
prompt [5/7] PACKAGE BODIES
prompt ------------------------------------------------------------

@@packages/04_academy_number_stepper_plugin_body.sql
@@packages/05_academy_session_api_body.sql
@@packages/06_academy_ui_body.sql


prompt
prompt [6/7] TRIGGERS
prompt ------------------------------------------------------------

@@triggers/01_trg_course_updated_at.sql
@@triggers/02_trg_training_session_updated_at.sql


prompt
prompt [7/7] SEED DATA
prompt ------------------------------------------------------------

@@seed/seed_all.sql


prompt
prompt ============================================================
prompt Oracle Academy - Database Core Deployment completed
prompt ============================================================