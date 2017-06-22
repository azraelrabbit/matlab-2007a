function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'csl_auto_table', pkgRG.findclass('rpt_auto_table'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'ShowFullName', 'bool', false, xlate('Show full path name'), 'SIMULINK_Report_Gen');
    % 15 19
    % 16 19
    % 17 19
    p = rptgen.prop(h, 'ShowNamePrompt', 'bool', true, xlate('Display property names as prompts'), 'SIMULINK_Report_Gen');
    % 19 23
    % 20 23
    % 21 23
    p = rptgen.prop(h, 'ObjectType', rptgen_sl.enumSimulinkTypeAuto, 'auto', xlate('Show current:'), 'SIMULINK_Report_Gen');
    % 23 27
    % 24 27
    % 25 27
    p = rptgen.prop(h, 'PropertyListMode', vertcat(cellhorzcat('auto', xlate('Determine properties automatically')), cellhorzcat('manual', xlate('Show properties:'))), 'auto', '', 'SIMULINK_Report_Gen');
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    p = rptgen.prop(h, 'PropertyList', 'string vector', {}, '', 'SIMULINK_Report_Gen');
    % 33 37
    % 34 37
    % 35 37
    rptgen.makeStaticMethods(h, {}, {'atGetName';'atGetObjects';'atGetPropertyList';'atGetPropertySource';'atGetPropertyValue';'atGetType';'atIgnoreValue'});
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
