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
    h = schema.class(pkg, 'chg_ax_loop', pkgRG.findclass('rpt_looper'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'Looptype', vertcat(cellhorzcat('all', xlate('All axes')), cellhorzcat('current', xlate('Current axes'))), 'all', xlate('Loop type'));
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'IncludeHidden', vertcat(cellhorzcat('findobj', xlate('Loop on axes with handle visibility "on"')), cellhorzcat('findall', xlate('Loop on all axes'))), 'findobj', '');
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    p = rptgen.prop(h, 'ExcludeSubclasses', 'bool', true, xlate('Exclude objects which subclass axes'));
    % 27 31
    % 28 31
    % 29 31
    p = rptgen.prop(h, 'SearchTerms', 'string vector', {}, xlate('Search terms'));
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    p.Visible = 'off';
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getDialogSchema';'loop_getLoopObjects';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState'});
    % 43 52
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
