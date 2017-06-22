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
    h = schema.class(pkg, 'csl_blk_count', pkgRG.findclass('rptcomponent'));
    % 13 15
    % 14 15
    p = rptgen.prop(h, 'IncludeBlocks', {'all','All blocks in model';'reported','All blocks in reported systems'}, 'all', '', 'SIMULINK_Report_Gen');
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = rptgen.prop(h, 'TableTitle', rptgen.makeStringType, 'Block Type Count', xlate('Table title'), 'SIMULINK_Report_Gen');
    % 22 25
    % 23 25
    % 24 25
    p = rptgen.prop(h, 'isBlockName', 'bool', true, xlate('Show block names in table'), 'SIMULINK_Report_Gen');
    % 26 29
    % 27 29
    % 28 29
    p = rptgen.prop(h, 'SortOrder', {'alpha','Alphabetically by block type';'numblocks','By number of blocks'}, 'alpha', xlate('Sort table'), 'SIMULINK_Report_Gen');
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    p = rptgen.prop(h, 'IncludeTotal', 'bool', false, xlate('Show total count'), 'SIMULINK_Report_Gen');
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    rptgen.makeStaticMethods(h, {}, {});
    % 41 42
end % function
