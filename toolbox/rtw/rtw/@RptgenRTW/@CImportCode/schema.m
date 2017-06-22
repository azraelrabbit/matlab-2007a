function schema
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    pkg = findpackage('RptgenRTW');
    pkgRG = findpackage('rptgen');
    % 22 23
    h = schema.class(pkg, 'CImportCode', pkgRG.findclass('rpt_section'));
    % 24 26
    % 25 26
    p = rptgen.prop(h, 'Source_files__auto_generated', 'bool', true, xlate('Source files (auto-generated)'));
    % 27 30
    % 28 30
    % 29 30
    p = rptgen.prop(h, 'Header_files__auto_generated', 'bool', true, xlate('Header files (auto-generated)'));
    % 31 34
    % 32 34
    % 33 34
    p = rptgen.prop(h, 'include_rtw_c', 'bool', true, xlate('Include RTW source files'));
    % 35 38
    % 36 38
    % 37 38
    p = rptgen.prop(h, 'include_rtw_h', 'bool', true, xlate('Include RTW Header files'));
    % 39 42
    % 40 42
    % 41 42
    p = rptgen.prop(h, 'Custom_files', 'bool', false, xlate('Custom files'));
    % 43 46
    % 44 46
    % 45 46
    rptgen.makeStaticMethods(h, {}, {});
    % 47 48
end % function
