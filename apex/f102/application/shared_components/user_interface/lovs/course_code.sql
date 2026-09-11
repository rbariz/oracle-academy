prompt --application/shared_components/user_interface/lovs/course_code
begin
--   Manifest
--     COURSE.CODE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>8402318500541485
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'ORACLE_ACADEMY'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(9411812137663020)
,p_lov_name=>'COURSE.CODE'
,p_static_id=>'course-code'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'COURSE'
,p_return_column_name=>'ID'
,p_display_column_name=>'CODE'
,p_default_sort_column_name=>'CODE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'SH256:hr3coHkC5fiWLbk54SnxBl--rJZpmajmf5Uwb3wcvHs'
);
wwv_flow_imp.component_end;
end;
/
