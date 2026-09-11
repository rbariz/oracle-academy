prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>8402318500541485
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'ORACLE_ACADEMY'
);
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'Sessions Calendar'
,p_alias=>'SESSIONS-CALENDAR'
,p_step_title=>'Sessions Calendar'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'08'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8637546351811464)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_menu_id=>wwv_flow_imp.id(8410257595563342)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8638248284811481)
,p_plug_name=>'Sessions Calendar'
,p_static_id=>'sessions-calendar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'VW_SESSION_CALENDAR'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'calendar_views_and_navigation', 'month:week:day:list:navigation',
  'display_column', 'CALENDAR_TITLE',
  'drag_and_drop', 'N',
  'end_date_column', 'ENDS_AT',
  'event_sorting', 'AUTOMATIC',
  'first_hour', '9',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'primary_key_column', 'MEETING_ID',
  'responsive_list_view', 'Y',
  'show_time', 'Y',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'STARTS_AT',
  'supplemental_information', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Room: &DISPLAY_LOCATION.',
    'Session: &SESSION_CODE.',
    'Status: &SESSION_STATUS.')),
  'time_format', '00',
  'view_edit_link', 'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_MEETING_ID:&MEETING_ID.')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9601374584057208)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8637546351811464)
,p_button_name=>'NEW_SESSION'
,p_static_id=>'new-session'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New Session'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_SOURCE_CONTEXT:GENERAL'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp.component_end;
end;
/
