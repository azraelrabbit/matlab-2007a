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
    h = schema.class(pkg, 'csf_obj_filter', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    allTypes = listReportableTypes(rptgen_sf.appdata_sf);
    % 15 17
    p = rptgen.prop(h, 'ObjectType', horzcat(allTypes, allTypes), 'Machine', xlate('Object type'), 'SIMULINK_Report_Gen');
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'repMinChildren', 'double', 0.0, xlate('Run only if Stateflow object has at least the following number of children:'), 'SIMULINK_Report_Gen');
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'addAnchor', 'bool', true, xlate('Automatically insert linking anchor'), 'SIMULINK_Report_Gen');
    % 25 29
    % 26 29
    % 27 29
    rptgen.makeStaticMethods(h, {}, {});
    % 29 31
