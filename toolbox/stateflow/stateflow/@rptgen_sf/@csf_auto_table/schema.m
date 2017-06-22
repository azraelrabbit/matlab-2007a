function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sf');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'csf_auto_table', pkgRG.findclass('rpt_auto_table'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'NameType', vertcat(cellhorzcat('name', xlate('Object name')), cellhorzcat('sfname', xlate('Object name with Stateflow path')), cellhorzcat('slsfname', xlate('Object name with Simulink and Stateflow path'))), 'name', xlate('Display name as'), 'SIMULINK_Report_Gen');
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    rptgen.makeStaticMethods(h, {}, {'atGetName';'atGetObjects';'atGetPropertyList';'atGetPropertySource';'atIgnoreValue'});
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
