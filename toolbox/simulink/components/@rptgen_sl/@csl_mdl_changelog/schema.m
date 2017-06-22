function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'csl_mdl_changelog', pkgRG.findclass('rptcomponent'));
    % 12 14
    lic = 'SIMULINK_Report_Gen';
    % 14 17
    % 15 17
    p = rptgen.prop(h, 'isAuthor', 'bool', false, xlate('Author name'), lic);
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'isVersion', 'bool', false, xlate('Version'), lic);
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'isDate', 'bool', true, xlate('Date changed'), lic);
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.prop(h, 'isComment', 'bool', true, xlate('Description of change'), lic);
    % 29 33
    % 30 33
    % 31 33
    p = rptgen.prop(h, 'isLimitRevisions', 'bool', false, xlate('Limit displayed revisions to: '), lic);
    % 33 37
    % 34 37
    % 35 37
    p = rptgen.prop(h, 'NumRevisions', 'int32', 12.0, '', lic);
    % 37 41
    % 38 41
    % 39 41
    p = rptgen.prop(h, 'isLimitDate', 'bool', false, xlate('Show revisions since date: '), lic);
    % 41 45
    % 42 45
    % 43 45
    p = rptgen.prop(h, 'DateLimit', rptgen.makeStringType, '%<datestr(now-14)>', '', lic);
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    p = rptgen.prop(h, 'TableTitle', rptgen.makeStringType, xlate('Model History'), xlate('Table title'), lic);
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    p = rptgen.makeProp(h, 'DateFormat', 'String', 'inherit', xlate('Date format'), lic);
    % 55 59
    % 56 59
    % 57 59
    p = rptgen.makeProp(h, 'SortOrder', vertcat(cellhorzcat('chronological', xlate('Oldest to most recent')), cellhorzcat('reversechronological', xlate('Most recent to oldest'))), 'reversechronological', xlate('Sort order'), lic);
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    p = rptgen.prop(h, 'isBorder', 'bool', true, '', lic);
    p.Visible = 'off';
    % 68 75
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    rptgen.makeStaticMethods(h, {}, {'parseHistory'});
    % 75 78
    % 76 78
