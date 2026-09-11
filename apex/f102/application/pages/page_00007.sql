prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Training Session Detail'
,p_alias=>'TRAINING-SESSION-DETAIL'
,p_step_title=>'Training Session Detail'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8658970890441868)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8663983026312427)
,p_name=>'Enrollments'
,p_static_id=>'enrollments'
,p_title=>'Enrollments'
,p_template=>4073835273271169698
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    enrollment_id,',
'    participant_name,',
'    organization,',
'    enrollment_status,',
'    attendance_pct,',
'    average_score,',
'    final_score,',
'    certified_flag',
'from vw_enrollment_progress',
'where session_id = :P7_SESSION_ID',
'order by participant_name'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Enrollment found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8664471975312432)
,p_query_column_id=>5
,p_column_alias=>'ATTENDANCE_PCT'
,p_column_display_sequence=>50
,p_column_heading=>'Attendance'
,p_column_format=>'990D0'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8664538714312433)
,p_query_column_id=>6
,p_column_alias=>'AVERAGE_SCORE'
,p_column_display_sequence=>60
,p_column_heading=>'Average Score'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8664732596312435)
,p_query_column_id=>8
,p_column_alias=>'CERTIFIED_FLAG'
,p_column_display_sequence=>80
,p_column_heading=>'Certified'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8664073910312428)
,p_query_column_id=>1
,p_column_alias=>'ENROLLMENT_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8664381003312431)
,p_query_column_id=>4
,p_column_alias=>'ENROLLMENT_STATUS'
,p_column_display_sequence=>40
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8664613977312434)
,p_query_column_id=>7
,p_column_alias=>'FINAL_SCORE'
,p_column_display_sequence=>70
,p_column_heading=>'Final Score'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8664262868312430)
,p_query_column_id=>3
,p_column_alias=>'ORGANIZATION'
,p_column_display_sequence=>30
,p_column_heading=>'Organization'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8664104959312429)
,p_query_column_id=>2
,p_column_alias=>'PARTICIPANT_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Participant'
,p_column_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8:P8_ENROLLMENT_ID:#ENROLLMENT_ID#'
,p_column_linktext=>'#PARTICIPANT_NAME#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8662410978312412)
,p_name=>'Meetings'
,p_static_id=>'meetings'
,p_title=>'Meetings'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    meeting_id,',
'    topic,',
'    to_char(starts_at, ''DD Mon YYYY, HH24:MI'') starts_at,',
'    to_char(ends_at, ''DD Mon YYYY, HH24:MI'') ends_at,',
'    display_location',
'from vw_session_calendar',
'where session_id = :P7_SESSION_ID',
'order by starts_at'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Metting found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8663420394312422)
,p_query_column_id=>5
,p_column_alias=>'DISPLAY_LOCATION'
,p_column_display_sequence=>80
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8663845443312426)
,p_query_column_id=>4
,p_column_alias=>'ENDS_AT'
,p_column_display_sequence=>70
,p_column_heading=>'Ends'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8663062687312418)
,p_query_column_id=>1
,p_column_alias=>'MEETING_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8663713165312425)
,p_query_column_id=>3
,p_column_alias=>'STARTS_AT'
,p_column_display_sequence=>60
,p_column_heading=>'Starts'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8663173134312419)
,p_query_column_id=>2
,p_column_alias=>'TOPIC'
,p_column_display_sequence=>20
,p_column_heading=>'Topic'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_MEETING_ID:#MEETING_ID#'
,p_column_linktext=>'#TOPIC#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8661392087312401)
,p_plug_name=>'SessionSummary'
,p_static_id=>'sessionsummary'
,p_title=>'Session Summary'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9600678626057201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8658970890441868)
,p_button_name=>'EDIT_SESSION'
,p_static_id=>'edit-session'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Edit Session'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_ID,P2_SOURCE_CONTEXT:&P7_SESSION_ID.,SESSION_DETAIL'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8662235794312410)
,p_name=>'P7_AVAILABLE_SEATS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Available Seats'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8662085511312408)
,p_name=>'P7_CAPACITY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Capacity'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8661526040312403)
,p_name=>'P7_COURSE_TITLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Course'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>9
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8662149213312409)
,p_name=>'P7_ENROLLMENT_COUNT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Enrolled'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8661775484312405)
,p_name=>'P7_LOCATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>6
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8661634522312404)
,p_name=>'P7_PERIOD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Period'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8661471439312402)
,p_name=>'P7_SESSION_CODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Session'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>6
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8652924899412302)
,p_name=>'P7_SESSION_ID'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8661867282312406)
,p_name=>'P7_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8661992289312407)
,p_name=>'P7_TRAINERS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8661392087312401)
,p_prompt=>'Trainers'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8662365391312411)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOAD_SESSION_DETAIL'
,p_static_id=>'load-session-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select session_code,',
'           course_title,',
'           to_char(start_date, ''DD Mon YYYY'')',
'             || '' - ''',
'             || to_char(end_date, ''DD Mon YYYY''),',
'           location,',
'           status_code,',
'           trainer_names,',
'           capacity,',
'           enrollment_count,',
'           available_seats',
'      into :P7_SESSION_CODE,',
'           :P7_COURSE_TITLE,',
'           :P7_PERIOD,',
'           :P7_LOCATION,',
'           :P7_STATUS,',
'           :P7_TRAINERS,',
'           :P7_CAPACITY,',
'           :P7_ENROLLMENT_COUNT,',
'           :P7_AVAILABLE_SEATS',
'      from vw_session_overview',
'     where id = :P7_SESSION_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8662365391312411
);
wwv_flow_imp.component_end;
end;
/
