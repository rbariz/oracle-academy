prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
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
 p_id=>9
,p_name=>'Course Detail'
,p_alias=>'COURSE-DETAIL'
,p_step_title=>'Course Detail'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9020622013674267)
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
 p_id=>wwv_flow_imp.id(9030042476379401)
,p_plug_name=>'CourseSummary'
,p_static_id=>'coursesummary'
,p_title=>'Course Summary'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9805495595922701)
,p_name=>'TrainingSessions'
,p_static_id=>'trainingsessions'
,p_title=>'Training Sessions'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'       session_code,',
'       start_date,',
'       end_date,',
'       location,',
'       status_code,',
'       trainer_names,',
'       capacity,',
'       enrollment_count,',
'       available_seats',
'from vw_session_overview',
'where course_id = :P9_COURSE_ID',
'order by start_date desc, session_code'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9806428842922711)
,p_query_column_id=>10
,p_column_alias=>'AVAILABLE_SEATS'
,p_column_display_sequence=>100
,p_column_heading=>'Available Seats'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9806213541922709)
,p_query_column_id=>8
,p_column_alias=>'CAPACITY'
,p_column_display_sequence=>80
,p_column_heading=>'Capacity'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9806846550922715)
,p_query_column_id=>4
,p_column_alias=>'END_DATE'
,p_column_display_sequence=>40
,p_column_heading=>'End Date'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9806390887922710)
,p_query_column_id=>9
,p_column_alias=>'ENROLLMENT_COUNT'
,p_column_display_sequence=>90
,p_column_heading=>'Enrollment Count'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9805567330922702)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9805901108922706)
,p_query_column_id=>5
,p_column_alias=>'LOCATION'
,p_column_display_sequence=>50
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9805661329922703)
,p_query_column_id=>2
,p_column_alias=>'SESSION_CODE'
,p_column_display_sequence=>20
,p_column_heading=>'Code'
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_SESSION_ID:#ID#'
,p_column_linktext=>'#SESSION_CODE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9806788980922714)
,p_query_column_id=>3
,p_column_alias=>'START_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'Start Date'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9806077742922707)
,p_query_column_id=>6
,p_column_alias=>'STATUS_CODE'
,p_column_display_sequence=>60
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(9806193715922708)
,p_query_column_id=>7
,p_column_alias=>'TRAINER_NAMES'
,p_column_display_sequence=>70
,p_column_heading=>'Trainer Names'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9427784135454201)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9020622013674267)
,p_button_name=>'CREATE_SESSION'
,p_static_id=>'create-session'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Create Session'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_COURSE_ID,P2_SOURCE_CONTEXT:&P9_COURSE_ID.,COURSE_DETAIL'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P9_STATUS'
,p_button_condition2=>'ACTIVE'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9031485640379415)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_button_name=>'EDIT'
,p_static_id=>'edit'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Course'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::P10_ID:&P9_COURSE_ID.'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9030368666379404)
,p_name=>'P9_CATEGORY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Category'
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
 p_id=>wwv_flow_imp.id(9030264082379403)
,p_name=>'P9_CODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Code'
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
 p_id=>wwv_flow_imp.id(9014586123641702)
,p_name=>'P9_COURSE_ID'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9030723405379408)
,p_name=>'P9_DESCRIPTION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Description'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>12
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9030471450379405)
,p_name=>'P9_DURATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Duration'
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
 p_id=>wwv_flow_imp.id(9030526467379406)
,p_name=>'P9_LEVEL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Level'
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
 p_id=>wwv_flow_imp.id(9031190403379412)
,p_name=>'P9_NEXT_SESSION_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Next Session Date'
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
 p_id=>wwv_flow_imp.id(9030809626379409)
,p_name=>'P9_SESSION_COUNT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Session Count'
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
 p_id=>wwv_flow_imp.id(9030600703379407)
,p_name=>'P9_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9031341677379414)
,p_name=>'P9_STATUS_DISPLAY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9030100529379402)
,p_name=>'P9_TITLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Title'
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
 p_id=>wwv_flow_imp.id(9030945153379410)
,p_name=>'P9_UPCOMING_SESSION_COUNT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9030042476379401)
,p_prompt=>'Upcoming Session Count'
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9031221532379413)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load_Course'
,p_static_id=>'load-course'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select title,',
'           code,',
'           category_code,',
'           level_code,',
'           duration_hours,',
'           status_code,',
'           description,',
'           session_count,',
'           upcoming_session_count,',
'           to_char(next_session_date, ''DD Mon YYYY'')',
'      into :P9_TITLE,',
'           :P9_CODE,',
'           :P9_CATEGORY,',
'           :P9_LEVEL,',
'           :P9_DURATION,',
'           :P9_STATUS,',
'           :P9_DESCRIPTION,',
'           :P9_SESSION_COUNT,',
'           :P9_UPCOMING_SESSION_COUNT,',
'           :P9_NEXT_SESSION_DATE',
'      from vw_course_catalog',
'     where id = :P9_COURSE_ID;',
'',
'',
'     :P9_STATUS_DISPLAY :=',
'    academy_ui.status_badge(',
'        ''COURSE'',',
'        :P9_STATUS',
'    );',
'',
'    :P9_NEXT_SESSION_DATE :=',
unistr('    nvl(:P9_NEXT_SESSION_DATE, ''\2014'');'),
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9031221532379413
);
wwv_flow_imp.component_end;
end;
/
