function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'cml_variable', pkgRG.findclass('rpt_var_display'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'Source', vertcat(cellhorzcat('W', xlate('Base workspace')), cellhorzcat('M', xlate('MAT-File')), cellhorzcat('G', xlate('Global variables')), cellhorzcat('direct', xlate('Direct: '))), 'W', xlate('Variable location'));
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    p = rptgen.prop(h, 'SourceDirect', 'MATLAB array', [], '');
    % 23 26
    % 24 26
    p = rptgen.prop(h, 'Filename', rptgen.makeStringType, 'matlab.mat', xlate('File name'));
    % 26 30
    % 27 30
    % 28 30
    p = rptgen.prop(h, 'Variable', rptgen.makeStringType, '', xlate('Variable name'));
    % 30 34
    % 31 34
    % 32 34
    rptgen.makeStaticMethods(h, {}, {'getDisplayName';'getDisplayValue'});
    % 34 38
    % 35 38
    % 36 38
