function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('rptgen_sf');
    pkgSL = findpackage('rptgen_sl');
    % 11 12
    h = schema.class(pkg, 'csf_chart_loop', pkgSL.findclass('csl_blk_loop'));
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = rptgen.prop(h, 'isSFFilterList', 'bool', false, xlate('Search Stateflow:'), 'SIMULINK_Report_Gen');
    % 21 24
    % 22 24
    % 23 24
    p = rptgen.prop(h, 'SFFilterTerms', 'string vector', {'Tag','MyTag'}, '', 'SIMULINK_Report_Gen');
    % 25 26
    p.Visible = 'off';
    % 27 29
    % 28 29
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getLoopObjects';'loop_getObjectType';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState'});
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
end % function
