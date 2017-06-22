function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkg, 'csl_blk_bus', pkgRG.findclass('rptcomponent'));
    % 13 15
    % 14 15
    p = rptgen.prop(h, 'isHierarchy', 'bool', false, xlate('Show bus Hierarchy'), 'SIMULINK_Report_Gen');
    % 16 19
    % 17 19
    % 18 19
    p = rptgen.prop(h, 'BusAnchor', 'bool', false, xlate('Insert linking anchor for bus blocks'), 'SIMULINK_Report_Gen');
    % 20 23
    % 21 23
    % 22 23
    p = rptgen.prop(h, 'SignalAnchor', 'bool', false, xlate('Insert linking anchor for signals'), 'SIMULINK_Report_Gen');
    % 24 27
    % 25 27
    % 26 27
    p = rptgen.prop(h, 'ListTitle', rptgen.makeStringType, '', xlate('Title'), 'SIMULINK_Report_Gen');
    % 28 31
    % 29 31
    % 30 31
    rptgen.makeStaticMethods(h, {}, {});
    % 32 33
end % function
