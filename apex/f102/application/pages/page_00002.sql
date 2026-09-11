prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Training Session'
,p_alias=>'TRAINING-SESSION'
,p_step_title=>'Training Session'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9410250299662962)
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
 p_id=>wwv_flow_imp.id(9410929735663006)
,p_plug_name=>'Training Session'
,p_static_id=>'training-session'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'TRAINING_SESSION'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9419455160663042)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_button_name=>'CANCEL_SESSION'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:2:P7_SESSION_ID:&P2_ID.'
,p_button_condition=>'P2_SOURCE_CONTEXT'
,p_button_condition2=>'SESSION_DETAIL'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9601163905057206)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_button_name=>'CANCEL_COURSE'
,p_static_id=>'cancel-course'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:2:P9_COURSE_ID:&P2_COURSE_ID.'
,p_button_condition=>'P2_SOURCE_CONTEXT'
,p_button_condition2=>'COURSE_DETAIL'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9601486378057209)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_button_name=>'CANCEL_GENERAL'
,p_static_id=>'cancel-general'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:2::'
,p_button_condition=>'P2_SOURCE_CONTEXT'
,p_button_condition2=>'GENERAL'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9420780285663046)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P2_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9830111598746008)
,p_button_sequence=>20
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2_ID is not null',
'and academy_session_api.can_delete_session(:P2_ID)'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9420347421663046)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'DELETE'
,p_button_condition=>'P2_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(9421123161663046)
,p_branch_action=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_SESSION_ID:&P2_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
,p_branch_condition_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_branch_condition=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(9830282335746009)
,p_branch_name=>'Go To Sessions'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(9830111598746008)
,p_branch_sequence=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9413650472663034)
,p_name=>'P2_CAPACITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_source_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_prompt=>'Capacity'
,p_source=>'CAPACITY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9411724917663018)
,p_name=>'P2_COURSE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_source_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_prompt=>'Course'
,p_source=>'COURSE_ID'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    title d,',
'    id    r',
'from course',
'where status_code = ''ACTIVE''',
'order by title'))
,p_read_only_when=>'P2_SOURCE_CONTEXT'
,p_read_only_when2=>'COURSE_DETAIL'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9413224306663032)
,p_name=>'P2_END_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_source_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_prompt=>'End Date'
,p_source=>'END_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9411347322663010)
,p_name=>'P2_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_source_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9414070542663034)
,p_name=>'P2_LOCATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_source_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_prompt=>'Location'
,p_source=>'LOCATION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>200
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9412455956663032)
,p_name=>'P2_SESSION_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_source_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_prompt=>'Session'
,p_source=>'SESSION_CODE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(9427872649454202)
,p_name=>'P2_SOURCE_CONTEXT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9412828034663032)
,p_name=>'P2_START_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_source_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_prompt=>'Start Date'
,p_source=>'START_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9414440508663034)
,p_name=>'P2_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_source_plug_id=>wwv_flow_imp.id(9410929735663006)
,p_item_default=>'PLANNED'
,p_prompt=>'Status Code'
,p_source=>'STATUS_CODE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Planned;PLANNED,Open;OPEN,In Progress;IN_PROGRESS,Completed;COMPLETED,Cancelled;CANCELLED'
,p_cHeight=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9428052544454204)
,p_validation_name=>'CAPACITY'
,p_static_id=>'capacity'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2_CAPACITY is null',
'or :P2_CAPACITY > 0'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Capacity must be greater than 0.'
,p_associated_item=>wwv_flow_imp.id(9413650472663034)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9428113453454205)
,p_validation_name=>'UNIQUE_KEY'
,p_static_id=>'new'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from training_session',
'where session_code = :P2_SESSION_CODE',
'  and id <> nvl(:P2_ID, -1)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'This Session Code already exists.'
,p_associated_item=>wwv_flow_imp.id(9412455956663032)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(9427999034454203)
,p_validation_name=>'START_END_DATE'
,p_static_id=>'start-end-date'
,p_validation_sequence=>10
,p_validation=>':P2_END_DATE >= :P2_START_DATE'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'End Date must be greater than or equal to Start Date.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9600843785057203)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE_MESSAGE'
,p_static_id=>'create'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application.g_print_success_message :=',
'    ''Training session created.'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(9420780285663046)
,p_internal_uid=>9600843785057203
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10006829298740302)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>' DELETE_MESSAGE'
,p_static_id=>'delete-message'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application.g_print_success_message :=',
'    ''Training session deleted.'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(9830111598746008)
,p_internal_uid=>10006829298740302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10006739435740301)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_SESSION'
,p_static_id=>'delete-session'
,p_process_sql_clob=>'academy_session_api.delete_session(:P2_ID);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(9830111598746008)
,p_internal_uid=>10006739435740301
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9600997170057204)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EDIT_MESSAGE'
,p_static_id=>'edit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_application.g_print_success_message :=',
'    ''Training session updated.'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(9420347421663046)
,p_internal_uid=>9600997170057204
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9421571430663051)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(9410929735663006)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Training Session'
,p_static_id=>'initialize-form-training-session'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'current_row_total_item', '',
  'next_primary_key_items', '',
  'previous_primary_key_items', '')).to_clob
,p_internal_uid=>9421571430663051
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(9421906721663054)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9410929735663006)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Training Session'
,p_static_id=>'process-form-training-session'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_internal_uid=>9421906721663054
);
wwv_flow_imp.component_end;
end;
/
