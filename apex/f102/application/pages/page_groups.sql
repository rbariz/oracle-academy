prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>8402318500541485
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'ORACLE_ACADEMY'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(8415399802563487)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
wwv_flow_imp.component_end;
end;
/
