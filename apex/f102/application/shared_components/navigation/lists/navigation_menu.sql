prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>8402318500541485
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'ORACLE_ACADEMY'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(8410710337563353)
,p_name=>'Navigation Menu'
,p_static_id=>'navigation-menu'
,p_version_scn=>'SH256:aeYHANCXPoZHHXU_pfUCqkBraC5yMGJtT39wffODHrg'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8583563538820468)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Course Catalog'
,p_static_id=>'course-catalog'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table-search'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8421971857563539)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_static_id=>'home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(9821502956064214)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Sessions'
,p_static_id=>'sessions'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table-search'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8637154311811351)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sessions Calendar'
,p_static_id=>'sessions-calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-calendar-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5'
);
wwv_flow_imp.component_end;
end;
/
