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
    h = schema.class(pkg, 'csl_sig_loop', pkgRG.findclass('rpt_looper'));
    % 12 14
    lic = 'SIMULINK_Report_Gen';
    % 14 17
    % 15 17
    p = rptgen.prop(h, 'SortBy', vertcat(cellhorzcat('alphabetical', xlate('Alphabetically by signal name')), cellhorzcat('alphabetical-exclude-empty', xlate('Alphabetically by signal name (exclude empty)')), cellhorzcat('systemalpha', xlate('Alphabetically by system name')), cellhorzcat('depth', xlate('By signal depth'))), 'alphabetical', xlate('Sort signals'), lic);
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'isBlockIncoming', 'bool', true, xlate('Include block input signals'), lic);
    % 25 29
    % 26 29
    % 27 29
    p = rptgen.prop(h, 'isBlockOutgoing', 'bool', true, xlate('Include block output signals'), lic);
    % 29 33
    % 30 33
    % 31 33
    p = rptgen.prop(h, 'isSystemIncoming', 'bool', true, xlate('Include system input signals'), lic);
    % 33 37
    % 34 37
    % 35 37
    p = rptgen.prop(h, 'isSystemOutgoing', 'bool', true, xlate('Include system output signals'), lic);
    % 37 41
    % 38 41
    % 39 41
    p = rptgen.prop(h, 'isSystemInternal', 'bool', true, xlate('Include system internal signals'), lic);
    % 41 45
    % 42 45
    % 43 45
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getDialogSchema';'loop_getLoopObjects';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState'});
    % 45 54
    % 46 54
    % 47 54
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
