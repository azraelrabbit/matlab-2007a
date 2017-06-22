function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen');
    % 10 11
    h = schema.class(pkg, 'cml_ver', pkg.findclass('rptcomponent'));
    % 12 14
    % 13 14
    p = rptgen.prop(h, 'isVersion', 'bool', true, xlate('Version number'));
    % 15 18
    % 16 18
    % 17 18
    p = rptgen.prop(h, 'isRelease', 'bool', true, xlate('Release number'));
    % 19 22
    % 20 22
    % 21 22
    p = rptgen.prop(h, 'isDate', 'bool', true, xlate('Release date'));
    % 23 26
    % 24 26
    % 25 26
    p = rptgen.prop(h, 'TableTitle', rptgen.makeStringType, 'Version Number', xlate('Table title:'));
    % 27 30
    % 28 30
    % 29 30
    p = rptgen.prop(h, 'isHeaderRow', 'bool', true, xlate('Display header row'));
    % 31 34
    % 32 34
    % 33 34
    p = rptgen.prop(h, 'isBorder', 'bool', true, xlate('Display table border'));
    % 35 36
    p.AccessFlags.PublicGet = 'off';
    % 37 39
    % 38 39
    rptgen.makeStaticMethods(h, {}, {});
    % 40 41
end % function
