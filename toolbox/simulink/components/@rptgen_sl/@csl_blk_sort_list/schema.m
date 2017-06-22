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
    h = schema.class(pkg, 'csl_blk_sort_list', pkgRG.findclass('rptcomponent'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'ListTitleMode', rptgen.enumAutoManual, 'auto', xlate('List Title'), 'SIMULINK_Report_Gen');
    % 15 19
    % 16 19
    % 17 19
    p = rptgen.prop(h, 'ListTitle', rptgen.makeStringType, '', '', 'SIMULINK_Report_Gen');
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.prop(h, 'isBlockType', 'bool', true, xlate('Include block type information'), 'SIMULINK_Report_Gen');
    % 26 30
    % 27 30
    % 28 30
    p = rptgen.prop(h, 'FollowNonVirtual', vertcat(cellhorzcat('on', xlate('On')), cellhorzcat('off', xlate('Off')), cellhorzcat('auto', xlate('Auto ("on" for models, "off" for systems)'))), 'auto', xlate('Look under non-virtual subsystems'), 'SIMULINK_Report_Gen');
    % 30 41
    % 31 41
    % 32 41
    % 33 41
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    rptgen.makeStaticMethods(h, {}, {});
    % 41 43
