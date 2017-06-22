function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('rptgen_hg');
    pkgRG = findpackage('rptgen');
    % 10 12
    h = schema.class(pkg, 'chg_fig_loop', pkgRG.findclass('rpt_looper'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'LoopType', vertcat(cellhorzcat('CURRENT', xlate('Current figure only')), cellhorzcat('ALL', xlate('Visible figures ')), cellhorzcat('TAG', xlate('All figures with tags: '))), 'CURRENT', xlate('Include figures'));
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    p = rptgen.prop(h, 'isDataFigureOnly', 'bool', true, xlate('Data figures only (Exclude applications)'));
    % 22 26
    % 23 26
    % 24 26
    p = rptgen.prop(h, 'UseRegexp', 'bool', true, xlate('Match with regular expressions'));
    % 26 30
    % 27 30
    % 28 30
    p = rptgen.prop(h, 'TagList', 'string vector', {});
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    rptgen.makeStaticMethods(h, {}, {'loop_getDialogSchema';'loop_getContextString';'loop_getLoopObjects';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState'});
    % 35 44
    % 36 44
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
