prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
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
 p_id=>8
,p_name=>'Enrollment Detail'
,p_alias=>'ENROLLMENT-DETAIL'
,p_page_mode=>'MODAL'
,p_step_title=>'Enrollment Detail'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8706297788650912)
,p_plug_name=>'Assessments'
,p_static_id=>'assessments'
,p_title=>'Assessments'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    assessment_type,',
'    assessment_date,',
'    score,',
'    comments',
'from assessment',
'where enrollment_id = :P8_ENROLLMENT_ID',
'order by assessment_date, id'))
,p_plug_source_type=>'NATIVE_JQM_REFLOW'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_query_no_data_found=>' No assessment recorded.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'layout_options', 'STRIPE:STROKE')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802470996299319)
,p_name=>'ASSESSMENT_DATE'
,p_data_type=>'DATE'
,p_is_visible=>true
,p_heading=>'Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802352100299318)
,p_name=>'ASSESSMENT_TYPE'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802619656299321)
,p_name=>'COMMENTS'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Comments'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802587900299320)
,p_name=>'SCORE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Score'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8705103558650901)
,p_plug_name=>'Attendance'
,p_static_id=>'attendance'
,p_title=>'Attendance'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    to_char(m.starts_at, ''DD Mon YYYY, HH24:MI'') as starts_at,',
'    to_char(m.ends_at,   ''DD Mon YYYY, HH24:MI'') as ends_at,',
'    m.topic,',
'    a.status_code,',
'    academy_ui.status_badge(',
'    ''ATTENDANCE'',',
'    a.status_code',
') as status_display,',
'    a.comments',
'from attendance a',
'join session_meeting m',
'  on m.id = a.meeting_id',
'where a.enrollment_id = :P8_ENROLLMENT_ID',
'order by m.starts_at'))
,p_plug_source_type=>'NATIVE_JQM_REFLOW'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_query_no_data_found=>' No attendance recorded.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'layout_options', 'STRIPE:STROKE')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802241044299317)
,p_name=>'COMMENTS'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Comments'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8801998072299314)
,p_name=>'ENDS_AT'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Ends'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8801833044299313)
,p_name=>'STARTS_AT'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Starts'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802169362299316)
,p_name=>'STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_is_visible=>false
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9000673747553601)
,p_name=>'STATUS_DISPLAY'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802091664299315)
,p_name=>'TOPIC'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Topic'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8707238279650922)
,p_plug_name=>'Certification'
,p_static_id=>'certification'
,p_title=>'Certification'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    certificate_number,',
'    version_no,',
'    issued_at,',
'    revoked_at,',
'    status_code,',
'    academy_ui.status_badge(',
'        ''CERTIFICATION'',',
'        status_code',
'    ) as status_display',
'from certification',
'where enrollment_id = :P8_ENROLLMENT_ID',
'order by version_no desc'))
,p_plug_source_type=>'NATIVE_JQM_REFLOW'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_query_no_data_found=>' No certification recorded.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'layout_options', 'STRIPE:STROKE')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802747507299322)
,p_name=>'CERTIFICATE_NUMBER'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Certificate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802974712299324)
,p_name=>'ISSUED_AT'
,p_data_type=>'DATE'
,p_is_visible=>true
,p_heading=>'Issued'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8803071435299325)
,p_name=>'REVOKED_AT'
,p_data_type=>'DATE'
,p_is_visible=>true
,p_heading=>'Revoked'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8803190784299326)
,p_name=>'STATUS_CODE'
,p_data_type=>'VARCHAR2'
,p_is_visible=>false
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9000741485553602)
,p_name=>'STATUS_DISPLAY'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8802802893299323)
,p_name=>'VERSION_NO'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Version'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'PLAIN',
  'value_identifies_row', 'N')).to_clob
,p_use_as_row_header=>false
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8707882995650928)
,p_plug_name=>'EnrollmentSections'
,p_static_id=>'enrollment-sections'
,p_title=>'Enrollment Sections'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8695562341534301)
,p_plug_name=>'EnrollmentDetails'
,p_static_id=>'enrollmentdetails'
,p_title=>'Enrollment Details'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8696306249534309)
,p_name=>'P8_ATTENDANCE_PCT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_prompt=>'Attendance (%)'
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
 p_id=>wwv_flow_imp.id(8695996495534305)
,p_name=>'P8_AVERAGE_SCORE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_prompt=>'Average Score'
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
 p_id=>wwv_flow_imp.id(8840094616527102)
,p_name=>'P8_CERTIFIED_DISPLAY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_prompt=>'Certified'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8696189847534307)
,p_name=>'P8_CERTIFIED_FLAG'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8664817221312436)
,p_name=>'P8_ENROLLMENT_ID'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8695750286534303)
,p_name=>'P8_ENROLLMENT_STATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8840203334527104)
,p_name=>'P8_ENROLLMENT_STATUS_DISPLAY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8696076526534306)
,p_name=>'P8_FINAL_SCORE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_prompt=>'Final Score'
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
 p_id=>wwv_flow_imp.id(8695827822534304)
,p_name=>'P8_ORGANIZATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_prompt=>'Organization'
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
 p_id=>wwv_flow_imp.id(8695603963534302)
,p_name=>'P8_PARTICIPANT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8695562341534301)
,p_prompt=>'Participant'
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
 p_id=>wwv_flow_imp.id(8696238319534308)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Enrollment Detail'
,p_static_id=>'load-enrollment-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' select participant_name,',
'           organization,',
'           enrollment_status,',
'           attendance_pct,',
'           average_score,',
'           final_score,',
'           certified_flag',
'      into :P8_PARTICIPANT_NAME,',
'           :P8_ORGANIZATION,',
'           :P8_ENROLLMENT_STATUS,',
'           :P8_ATTENDANCE_PCT,',
'           :P8_AVERAGE_SCORE,',
'           :P8_FINAL_SCORE,',
'           :P8_CERTIFIED_FLAG',
'      from vw_enrollment_progress',
'     where enrollment_id = :P8_ENROLLMENT_ID;',
'     ',
'    :P8_CERTIFIED_DISPLAY :=',
'    academy_ui.status_badge(',
'        ''CERTIFIED'',',
'        :P8_CERTIFIED_FLAG',
'    );',
'',
'',
'    :P8_ENROLLMENT_STATUS_DISPLAY :=',
'    academy_ui.status_badge(',
'        ''ENROLLMENT'',',
'        :P8_ENROLLMENT_STATUS',
'    );',
'',
'    :P8_AVERAGE_SCORE :=',
unistr('    nvl(:P8_AVERAGE_SCORE, ''\2014'');'),
'',
':P8_FINAL_SCORE :=',
unistr('    nvl(:P8_FINAL_SCORE, ''\2014'');'),
' end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>8696238319534308
);
wwv_flow_imp.component_end;
end;
/
