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
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkg, 'csf_machine_loop', pkgRG.findclass('rpt_looper'));
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = rptgen.prop(h, 'isSFFilterList', 'bool', false, xlate('Search Stateflow:'), 'SIMULINK_Report_Gen');
    % 22 25
    % 23 25
    % 24 25
    p = rptgen.prop(h, 'SFFilterTerms', 'string vector', {'Tag','MyTag'}, '', 'SIMULINK_Report_Gen');
    % 26 27
    p.Visible = 'off';
    % 28 30
    % 29 30
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getLoopObjects';'loop_getObjectType';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState'});
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
end % function
