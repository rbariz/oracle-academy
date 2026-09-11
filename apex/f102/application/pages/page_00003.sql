prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'Sessions'
,p_alias=>'SESSIONS'
,p_step_title=>'Sessions'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2528119710305719084
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9821943341064279)
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
 p_id=>wwv_flow_imp.id(9823527841064321)
,p_plug_name=>'Button Bar'
,p_static_id=>'button-bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_plug_source=>'<div id="active_facets"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9822790642064298)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(9822649689064298)
,p_landmark_label=>'Filters'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9829605894746003)
,p_name=>'P3_CATEGORY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9822790642064298)
,p_prompt=>'Category'
,p_source=>'CATEGORY_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:APEX;APEX,ARCHITECTURE;ARCHITECTURE,DATA;DATA,DATABASE;DATABASE,ORACLE;ORACLE'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9829503360746002)
,p_name=>'P3_COURSE_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9822790642064298)
,p_prompt=>'Course'
,p_source=>'COURSE_ID'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select title d,',
'       id r',
'from course',
'order by title'))
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9829901358746006)
,p_name=>'P3_PERIOD_BUCKET'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9822790642064298)
,p_prompt=>'Period'
,p_source=>'PERIOD_BUCKET'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Current;CURRENT,Next 30 Days;NEXT_30,Next 90 Days;NEXT_90,Later;LATER,Past;PAST'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9823227288064315)
,p_name=>'P3_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9822790642064298)
,p_prompt=>'Search'
,p_source=>'SESSION_CODE,COURSE_CODE,COURSE_TITLE,CATEGORY_CODE,LEVEL_CODE,LOCATION,STATUS_CODE,TRAINER_NAMES'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9829455072746001)
,p_name=>'P3_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9822790642064298)
,p_item_default=>'PLANNED'
,p_prompt=>'Status'
,p_source=>'STATUS_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Planned;PLANNED,Open;OPEN,In Progress;IN_PROGRESS,Completed;COMPLETED,Cancelled;CANCELLED'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9822649689064298)
,p_plug_name=>'Search Results'
,p_static_id=>'search-results'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'VW_SESSION_OVERVIEW'
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{ "itemName": "P3_ORDER_BY", "orderBys": [{"key":"SESSION_CODE","expr":"\"SESSION_CODE\" asc"},{"key":"COURSE_CODE","expr":"\"COURSE_CODE\" asc"}]}'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(9824528082064443)
,p_region_id=>wwv_flow_imp.id(9822649689064298)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'SESSION_CODE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'COURSE_TITLE'
,p_body_adv_formatting=>false
,p_body_column_name=>'PERIOD'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'TRAINER_NAMES'
,p_badge_column_name=>'STATUS_CODE'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(9829722159746004)
,p_card_id=>wwv_flow_imp.id(9824528082064443)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_SESSION_ID: &ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9823967211064323)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9823527841064321)
,p_button_name=>'RESET'
,p_static_id=>'reset'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:RR,3::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9825498799064470)
,p_name=>'P3_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9822649689064298)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'SESSION_CODE'
,p_prompt=>'Order By'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Session Code;SESSION_CODE,Course Code;COURSE_CODE'
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp.component_end;
end;
/
