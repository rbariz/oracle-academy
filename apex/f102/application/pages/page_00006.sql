prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>'Session Meeting Detail'
,p_alias=>'SESSION-MEETING-DETAIL'
,p_page_mode=>'MODAL'
,p_step_title=>'Session Meeting Detail'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8653036484412303)
,p_plug_name=>'DrawerActions'
,p_static_id=>'draweractions'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8640229394400402)
,p_plug_name=>'MeetingDetails'
,p_static_id=>'meetingdetails'
,p_title=>'Meeting Details'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8653117504412304)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8653036484412303)
,p_button_name=>'VIEW_SESSION'
,p_static_id=>'view-session'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'View Training Session'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_SESSION_ID:&P6_SESSION_ID.'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8640759513400407)
,p_name=>'P6_COURSE_TITLE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8640229394400402)
,p_prompt=>'Course'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8640685694400406)
,p_name=>'P6_DISPLAY_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8640229394400402)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8640444203400404)
,p_name=>'P6_ENDS_AT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8640229394400402)
,p_prompt=>'Ends At'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8640168855400401)
,p_name=>'P6_MEETING_ID'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8640801516400408)
,p_name=>'P6_SESSION_CODE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8640229394400402)
,p_prompt=>'Session'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8652803799412301)
,p_name=>'P6_SESSION_ID'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8640968240400409)
,p_name=>'P6_SESSION_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8640229394400402)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8640562123400405)
,p_name=>'P6_STARTS_AT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8640229394400402)
,p_prompt=>'Starts At'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8640352791400403)
,p_name=>'P6_TOPIC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8640229394400402)
,p_prompt=>'Topic'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8641036419400410)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOAD_MEETING_DETAIL'
,p_static_id=>'load-meeting-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select session_id,',
'           topic,',
'           to_char(starts_at, ''DD Mon YYYY, HH24:MI''),',
'           to_char(ends_at,   ''DD Mon YYYY, HH24:MI''),',
'           display_location,',
'           session_code,',
'           course_title,',
'           session_status',
'      into :P6_SESSION_ID,',
'           :P6_TOPIC,',
'           :P6_STARTS_AT,',
'           :P6_ENDS_AT,',
'           :P6_DISPLAY_LOCATION,',
'           :P6_SESSION_CODE,',
'           :P6_COURSE_TITLE,',
'           :P6_SESSION_STATUS',
'      from vw_session_calendar',
'     where meeting_id = :P6_MEETING_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8641036419400410
);
wwv_flow_imp.component_end;
end;
/
