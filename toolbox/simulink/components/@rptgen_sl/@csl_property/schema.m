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
    h = schema.class(pkg, 'csl_property', pkgRG.findclass('rpt_var_display'));
    % 13 14
    lic = 'SIMULINK_Report_Gen';
    % 15 17
    % 16 17
    p = rptgen.prop(h, 'ObjectType', rptgen_sl.enumSimulinkType, 'System', xlate('Object type'), lic);
    % 18 21
    % 19 21
    % 20 21
    p = rptgen.prop(h, 'ModelProperty', rptgen.makeStringType, 'Name', xlate('Model parameter name'), lic);
    % 22 25
    % 23 25
    % 24 25
    p = rptgen.prop(h, 'SystemProperty', rptgen.makeStringType, 'Name', xlate('System parameter name'), lic);
    % 26 29
    % 27 29
    % 28 29
    p = rptgen.prop(h, 'BlockProperty', rptgen.makeStringType, 'Name', xlate('Block parameter name'), lic);
    % 30 33
    % 31 33
    % 32 33
    p = rptgen.prop(h, 'SignalProperty', rptgen.makeStringType, 'Name', xlate('Signal parameter name'), lic);
    % 34 37
    % 35 37
    % 36 37
    p = rptgen.prop(h, 'AnnotationProperty', rptgen.makeStringType, 'Text', xlate('Annotation parameter name'), lic);
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    rptgen.makeStaticMethods(h, {}, {'getDisplayName';'getDisplayValue'});
    % 47 50
    % 48 50
    % 49 50
end % function
