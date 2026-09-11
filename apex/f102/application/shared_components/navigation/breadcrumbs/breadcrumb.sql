prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>8402318500541485
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'ORACLE_ACADEMY'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(8410257595563342)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8584511656820526)
,p_short_name=>'Course Catalog'
,p_static_id=>'course-catalog'
,p_link=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9021269814674281)
,p_short_name=>'Course Detail'
,p_static_id=>'course-detail'
,p_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9048995373544210)
,p_short_name=>'Course Form'
,p_static_id=>'course-form'
,p_link=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8410403263563345)
,p_short_name=>'Home'
,p_static_id=>'home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9822439643064296)
,p_short_name=>'Sessions'
,p_static_id=>'sessions'
,p_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8638092106811476)
,p_short_name=>'Sessions Calendar'
,p_static_id=>'sessions-calendar'
,p_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(9410807605662978)
,p_short_name=>'Training Session'
,p_static_id=>'training-session'
,p_link=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8659590544441890)
,p_short_name=>'Training Session Detail'
,p_static_id=>'training-session-detail'
,p_link=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp.component_end;
end;
/
