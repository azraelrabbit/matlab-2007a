function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgSF = findpackage('rptgen_sf');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkgSF, 'csf_obj_name', pkgRG.findclass('rpt_name'));
    % 12 14
    p = rptgen.prop(h, 'NameType', vertcat(cellhorzcat('name', xlate('Object name')), cellhorzcat('sfname', xlate('Object name with Stateflow path')), cellhorzcat('slsfname', xlate('Object name with Simulink and Stateflow path'))), 'name', xlate('Display name as'), 'SIMULINK_Report_Gen');
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    rptgen.makeStaticMethods(h, {}, {'name_getName';'name_getObject';'name_getPropSrc'});
    % 21 26
    % 22 26
    % 23 26
    % 24 26
