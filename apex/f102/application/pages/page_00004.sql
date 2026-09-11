prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'Course Catalog'
,p_alias=>'COURSE-CATALOG'
,p_step_title=>'Course Catalog'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2528119710305719084
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8583906226820518)
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
 p_id=>wwv_flow_imp.id(8587546138820542)
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
 p_id=>wwv_flow_imp.id(8584834755820529)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(8584750811820529)
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
 p_id=>wwv_flow_imp.id(8586439320820540)
,p_name=>'P4_CATEGORY_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8584834755820529)
,p_prompt=>'Category Code'
,p_source=>'CATEGORY_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
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
 p_id=>wwv_flow_imp.id(8585625453820540)
,p_name=>'P4_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8584834755820529)
,p_prompt=>'Code'
,p_source=>'CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
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
 p_id=>wwv_flow_imp.id(8629963381516901)
,p_name=>'P4_DURATION_HOURS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8584834755820529)
,p_prompt=>'Duration Hours'
,p_source=>'DURATION_HOURS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_lov=>'STATIC2:Up to 12 h;|13,13 - 16 h;13|17,17 - 20 h;17|21,Over 20 h;21|'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'D'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8586883470820542)
,p_name=>'P4_LEVEL_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8584834755820529)
,p_prompt=>'Level Code'
,p_source=>'LEVEL_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
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
 p_id=>wwv_flow_imp.id(8585243465820535)
,p_name=>'P4_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8584834755820529)
,p_prompt=>'Search'
,p_source=>'CODE,TITLE,CATEGORY_CODE,LEVEL_CODE,STATUS_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8587262448820542)
,p_name=>'P4_STATUS_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8584834755820529)
,p_prompt=>'Status Code'
,p_source=>'STATUS_CODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
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
 p_id=>wwv_flow_imp.id(8586088746820540)
,p_name=>'P4_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8584834755820529)
,p_prompt=>'Title'
,p_source=>'TITLE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
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
 p_id=>wwv_flow_imp.id(8584750811820529)
,p_plug_name=>'Search Results'
,p_static_id=>'search-results'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'VW_COURSE_CATALOG'
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{ "itemName": "P4_ORDER_BY", "orderBys": [{"key":"CATEGORY_CODE","expr":"\"CATEGORY_CODE\" asc"},{"key":"LEVEL_CODE","expr":"\"LEVEL_CODE\" asc"},{"key":"DURATION_HOURS","expr":"\"DURATION_HOURS\" asc"}]}'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(8588527464820757)
,p_region_id=>wwv_flow_imp.id(8584750811820529)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CODE'
,p_body_adv_formatting=>false
,p_body_column_name=>'DESCRIPTION'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'COURSE_MEDIA'
,p_badge_column_name=>'STATUS_CODE'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(9014477148641701)
,p_card_id=>wwv_flow_imp.id(8588527464820757)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_COURSE_ID:&ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9401722516432001)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8583906226820518)
,p_button_name=>'CREATE_COURSE'
,p_static_id=>'create-course'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Course'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:10::'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8587905626820543)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8587546138820542)
,p_button_name=>'RESET'
,p_static_id=>'reset'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:RR,4::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8589493354820768)
,p_name=>'P4_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8584750811820529)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'CATEGORY_CODE'
,p_prompt=>'Order By'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Category Code;CATEGORY_CODE,Level Code;LEVEL_CODE,Duration Hours;DURATION_HOURS'
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
