function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    pkg = findpackage('rptgen_sl');
    pkgRG = findpackage('rptgen');
    % 13 15
    h = schema.class(pkg, 'CLibinfo', pkgRG.findclass('rptcomponent'));
    % 15 17
    lic = 'SIMULINK_Report_Gen';
    % 17 19
    p = rptgen.prop(h, 'isBlock', 'bool', true, xlate('Block'), lic);
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'isLibrary', 'bool', true, xlate('Library'), lic);
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.prop(h, 'isReferenceBlock', 'bool', true, xlate('Reference block'), lic);
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    p = rptgen.prop(h, 'isLinkStatus', 'bool', true, xlate('Link status'), lic);
    % 35 39
    % 36 39
    % 37 39
    p = rptgen.prop(h, 'Title', rptgen.makeStringType, xlate('Dependencies'), xlate('Title'), lic);
    % 39 42
    % 40 42
    p = rptgen.prop(h, 'Sort', vertcat(cellhorzcat('Block', xlate('Block')), cellhorzcat('Library', xlate('Library')), cellhorzcat('ReferenceBlock', xlate('Reference block')), cellhorzcat('LinkStatus', xlate('Link status'))), 'Block', xlate('Sort table by'), lic);
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    p = rptgen.prop(h, 'MergeRows', 'bool', false, xlate('Merge repeated rows'), lic);
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    rptgen.makeStaticMethods(h, {}, {});
    % 55 57
