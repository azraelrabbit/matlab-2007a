function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen_sf');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkg, 'csf_property', pkgRG.findclass('rpt_var_display'));
    % 13 14
    p = rptgen.prop(h, 'StateflowProperty', rptgen.makeStringType, 'Name', xlate('Property name'), 'SIMULINK_Report_Gen');
    % 15 18
    % 16 18
    % 17 18
    rptgen.makeStaticMethods(h, {}, {'getDisplayName';'getDisplayValue'});
    % 19 22
    % 20 22
    % 21 22
end % function
