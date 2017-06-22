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
    h = schema.class(pkg, 'CCodeGenSummary', pkgRG.findclass('rpt_section'));
    % 24 26
    % 25 26
    p = rptgen.prop(h, 'Makefile', 'bool', false, xlate('Makefile and make command'));
    % 27 30
    % 28 30
    % 29 30
    p = rptgen.prop(h, 'Imported_files', 'bool', false, xlate('Imported files'));
    % 31 34
    % 32 34
    % 33 34
    p = rptgen.prop(h, 'Subsystem', 'bool', true, xlate('Subsystem map'));
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    p = rptgen.prop(h, 'Configuration_settings', 'bool', true, xlate('Configuration settings'));
    % 40 43
    % 41 43
    % 42 43
    p = rptgen.prop(h, 'General_information', 'bool', true, xlate('General information'));
    % 44 46
    % 45 46
    rptgen.makeStaticMethods(h, {}, {});
    % 47 48
end % function
