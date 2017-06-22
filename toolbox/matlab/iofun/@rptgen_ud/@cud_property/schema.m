function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgUD = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkgUD, 'cud_property', pkgRG.findclass('rpt_var_display'));
    % 13 14
    p = rptgen.makeProp(h, 'UddType', rptgen_ud.enumObjectTypeAuto, 'auto', xlate('Type'));
    % 15 17
    % 16 17
    p = rptgen.makeProp(h, 'PropertyName', rptgen.makeStringType, 'Name', xlate('Property'));
    % 18 21
    % 19 21
    % 20 21
    rptgen.makeStaticMethods(h, {}, {'getDisplayName';'getDisplayValue'});
    % 22 25
    % 23 25
    % 24 25
end % function
