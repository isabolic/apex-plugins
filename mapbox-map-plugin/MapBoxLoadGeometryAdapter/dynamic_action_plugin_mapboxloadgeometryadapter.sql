set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.2.00.07'
,p_default_workspace_id=>999999
,p_default_application_id=>100
,p_default_owner=>'PLAYGROUND'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/mapboxloadgeometryadapter
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(8966021210298693)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'MAPBOXLOADGEOMETRYADAPTER'
,p_display_name=>'MapBoxLoadGeometryAdapter'
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>'http://playground/ws/mapbox.load.geometry.adapter.js'
,p_render_function=>'apex_plugin_pkg.mapbox_loadgeom_adapter_render'
,p_ajax_function=>'apex_plugin_pkg.mapbox_loadgeom_adapter_ajax'
,p_standard_attributes=>'ITEM:BUTTON:REGION:JQUERY_SELECTOR:ONLOAD:STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(8966781050347202)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Map region static ID'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(8967680774359718)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Apex item with column id'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_default_value=>'rowid'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(8970076550015077)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Geometry style JSON object'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'{}'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(8971517793099712)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Zoom to geometry'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(9001523938246166)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Geometry table owner'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_text_case=>'UPPER'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(9002279978247305)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Geometry table name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_text_case=>'UPPER'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(9004173469252868)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Geometry column name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(9016814466190877)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Table column id'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(9021969760633533)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Column is already geojson format'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0A202A205B6372656174656420627920697361626F6C6963207361626F6C69632E6976616E40676D61696C2E636F6D5D0A202A2F0A2866756E6374696F6E282429207B0A20202020766172206F7074696F6E73203D207B0A20202020202020206D';
wwv_flow_api.g_varchar2_table(2) := '6170526567696F6E49643A206E756C6C2C0A2020202020202020617065784974656D3A6E756C6C2C0A20202020202020207374796C653A6E756C6C2C0A20202020202020206D6F6E69746F72417065784974656D3A747275650A202020207D3B0A0A2020';
wwv_flow_api.g_varchar2_table(3) := '20202F2A2A0A20202020202A205B747269676765724576656E7420202020202D20505249564154452068616E646C657220666E202D20747269676765722061706578206576656E74735D0A20202020202A2040706172616D20537472696E672065767420';
wwv_flow_api.g_varchar2_table(4) := '2D2061706578206576656E74206E616D6520746F20747269676765720A20202020202A2F0A2020202076617220747269676765724576656E74203D2066756E6374696F6E286576742C206576744461746129207B0A2020202020202020746869732E636F';
wwv_flow_api.g_varchar2_table(5) := '6E7461696E65722E74726967676572286576742C205B657674446174615D293B0A202020207D3B0A0A20202020617065782E706C7567696E732E6D6170626F782E4D6170426F784C6F616447656F6D6574727941646170746572203D2066756E6374696F';
wwv_flow_api.g_varchar2_table(6) := '6E286F70747329207B0A2020202020202020746869732E726567696F6E203D206E756C6C3B0A2020202020202020746869732E617065786E616D65203D20224D6170426F784C6F616447656F6D6574727941646170746572223B0A202020202020202074';
wwv_flow_api.g_varchar2_table(7) := '6869732E6D6170426F784D6170203D206E756C6C3B0A2020202020202020746869732E246974656D73203D207B0A20202020202020202020202062626F784974656D203A206E756C6C2C0A2020202020202020202020207A6F6F6D4C6576656C4974656D';
wwv_flow_api.g_varchar2_table(8) := '203A206E756C6C0A20202020202020207D0A2020202020202020746869732E696E6974203D2066756E6374696F6E2829207B0A2020202020202020202020200A20202020202020202020202069662028242E6973506C61696E4F626A656374286F707469';
wwv_flow_api.g_varchar2_table(9) := '6F6E732929207B0A20202020202020202020202020202020746869732E6F7074696F6E73203D20242E657874656E6428747275652C207B7D2C20746869732E6F7074696F6E732C206F7074696F6E732C206F707473293B0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(10) := '7D20656C7365207B0A202020202020202020202020202020207468726F772022617065782E706C7567696E732E4D6170426F784C6F616447656F6D65747279416461707465723A20496E76616C6964206F7074696F6E73207061737365642E223B0A2020';
wwv_flow_api.g_varchar2_table(11) := '202020202020202020207D0A0A20202020202020202020202069662028746869732E6F7074696F6E732E6D6170526567696F6E4964203D3D3D206E756C6C29207B0A202020202020202020202020202020207468726F772022617065782E706C7567696E';
wwv_flow_api.g_varchar2_table(12) := '732E4D6170426F784C6F616447656F6D65747279416461707465723A206D6170526567696F6E49642069732072657175697265642E223B0A2020202020202020202020207D0A0A202020202020202020202020746869732E726567696F6E203D20242822';
wwv_flow_api.g_varchar2_table(13) := '2322202B20746869732E6F7074696F6E732E6D6170526567696F6E4964293B0A0A20202020202020202020202069662028746869732E726567696F6E2E6C656E67746820213D3D203129207B0A202020202020202020202020202020207468726F772022';
wwv_flow_api.g_varchar2_table(14) := '617065782E706C7567696E732E4D6170426F784C6F616447656F6D65747279416461707465723A20496E76616C696420726567696F6E2073656C6563746F722E223B0A2020202020202020202020207D0A0A202020202020202020202020746869732E6D';
wwv_flow_api.g_varchar2_table(15) := '6170426F784D6170203D20746869732E726567696F6E2E6461746128226D6170626F78526567696F6E22293B0A2020202020202020202020200A20202020202020202020202069662028242E6973506C61696E4F626A65637428746869732E6D6170426F';
wwv_flow_api.g_varchar2_table(16) := '784D617029203D3D3D2066616C736529207B0A202020202020202020202020202020207468726F772022617065782E706C7567696E732E4D6170426F784C6F616447656F6D65747279416461707465723A2043616E277420616363657373206D6170626F';
wwv_flow_api.g_varchar2_table(17) := '78526567696F6E20726567696F6E20646174612E223B0A2020202020202020202020207D0A0A202020202020202020202020746869732E246974656D732E67656F6D65747279203D202428222322202B20746869732E6F7074696F6E732E617065784974';
wwv_flow_api.g_varchar2_table(18) := '656D293B2020202020202020202020200A202020202020202020202020746869732E246974656D732E67656F6D657472792E6461746128224D6170426F784C6F616447656F6D6574727941646170746572222C2074686973293B0A0A2020202020202020';
wwv_flow_api.g_varchar2_table(19) := '2020202072657475726E20746869733B0A20202020202020207D0A202020202020202072657475726E20746869732E696E697428293B0A202020207D3B0A0A20202020617065782E706C7567696E732E6D6170626F782E4D6170426F784C6F616447656F';
wwv_flow_api.g_varchar2_table(20) := '6D65747279416461707465722E70726F746F74797065203D207B0A2020202020202020206C6F616447656F6D657472793A66756E6374696F6E206C6F616447656F6D6574727928297B0A2020202020202020202020202020202069662028746869732E24';
wwv_flow_api.g_varchar2_table(21) := '6974656D732E67656F6D657472792E76616C2829297B0A2020202020202020202020202020202020202020746869732E6D6170426F784D61702E73657447656F4A534F4E28746869732E246974656D732E67656F6D657472792E76616C2829293B0A2020';
wwv_flow_api.g_varchar2_table(22) := '20202020202020202020202020207D0A0A2020202020202020202020202020202072657475726E20746869732E6C6F616447656F6D657472792E62696E642874686973293B0A2020202020202020207D0A202020207D3B0A0A7D2928617065782E6A5175';
wwv_flow_api.g_varchar2_table(23) := '657279293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(8966390607343753)
,p_plugin_id=>wwv_flow_api.id(8966021210298693)
,p_file_name=>'mapbox.load.geometry.adapter.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
