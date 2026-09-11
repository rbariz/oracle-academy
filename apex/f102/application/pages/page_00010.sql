prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Course Form'
,p_alias=>'COURSE-FORM'
,p_step_title=>'Course Form'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9048300219544204)
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
 p_id=>wwv_flow_imp.id(9049112631544226)
,p_plug_name=>'Course Form'
,p_static_id=>'course-form'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'COURSE'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9057316108544251)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9058683855544260)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P10_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9057867765544260)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P10_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9058202078544260)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P10_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(9059002023544260)
,p_branch_action=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::P9_COURSE_ID:&P10_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9051149898544240)
,p_name=>'P10_CATEGORY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_source_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_default=>'APEX'
,p_prompt=>'Category Code'
,p_source=>'CATEGORY_CODE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:APEX;APEX,ARCHITECTURE;ARCHITECTURE,DATA;DATA,DATABASE;DATABASE,ORACLE;ORACLE'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9049939151544234)
,p_name=>'P10_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_source_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_prompt=>'Code'
,p_source=>'CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9050705921544239)
,p_name=>'P10_DESCRIPTION'
,p_data_type=>'CLOB'
,p_source_data_type=>'CLOB'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_source_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cHeight=>4
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9051976658544242)
,p_name=>'P10_DURATION_HOURS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_source_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_prompt=>'Duration Hours'
,p_source=>'DURATION_HOURS'
,p_display_as=>'PLUGIN_COM.ORACLEACADEMY.NUMBER_STEPPER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maximum_value', '20',
  'minimum_value', '1',
  'step', '2')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9049576417544228)
,p_name=>'P10_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_source_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9051536084544240)
,p_name=>'P10_LEVEL_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_source_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_default=>'BEGINNER'
,p_prompt=>'Level Code'
,p_source=>'LEVEL_CODE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:ADVANCED;ADVANCED,BEGINNER;BEGINNER,INTERMEDIATE;INTERMEDIATE'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9052351666544242)
,p_name=>'P10_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_source_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_default=>'ACTIVE'
,p_prompt=>'Status Code'
,p_source=>'STATUS_CODE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:ACTIVE;ACTIVE,INACTIVE;INACTIVE'
,p_cHeight=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9226375110749301)
,p_name=>'P10_TEST'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_prompt=>'Test Duration'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9050397428544237)
,p_name=>'P10_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_item_source_plug_id=>wwv_flow_imp.id(9049112631544226)
,p_prompt=>'Title'
,p_source=>'TITLE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9059426266544271)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9049112631544226)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Course Form'
,p_static_id=>'initialize-form-course-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>9059426266544271
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9059876887544275)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9049112631544226)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Course Form'
,p_static_id=>'process-form-course-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9059876887544275
);
wwv_flow_imp.component_end;
end;
/
