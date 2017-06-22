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
    h = schema.class(pkg, 'crg_nest_set', pkg.findclass('rptcomponent'));
    % 12 14
    % 13 14
    p = rptgen.prop(h, 'FileName', rptgen.makeStringType, '', xlate('Report filename'));
    % 15 18
    % 16 18
    % 17 18
    p = rptgen.prop(h, 'Inline', 'bool', true, xlate('Inline nested report in this report'));
    % 19 22
    % 20 22
    % 21 22
    p = rptgen.prop(h, 'InsertFilename', 'bool', false, xlate('Insert link to external report'));
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = rptgen.prop(h, 'IncrementFilename', 'bool', true, xlate('Increment file name to prevent overwriting'));
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    p = rptgen.prop(h, 'RecursionLimit', 'double', 1.0, xlate('Recursion limit'));
    % 33 36
    % 34 36
    % 35 36
    p = rptgen.prop(h, 'FindAllFiles', 'bool', false, xlate('Nest all reports with specified file name'));
    % 37 41
    % 38 41
    % 39 41
    % 40 41
    p = rptgen.prop(h, 'RuntimeFileName', 'string', '', '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 44 46
    % 45 46
    p = rptgen.prop(h, 'RuntimeNestedReport', 'handle', [], '', 2.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    % 53 54
    rptgen.makeStaticMethods(h, {}, {});
    % 55 56
end % function
