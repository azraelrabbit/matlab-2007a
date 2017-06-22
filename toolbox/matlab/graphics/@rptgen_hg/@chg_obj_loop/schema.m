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
    h = schema.class(pkg, 'chg_obj_loop', pkgRG.findclass('rpt_looper'));
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'IncludeHidden', vertcat(cellhorzcat('findobj', xlate('Loop on objects with handle visibility "on"')), cellhorzcat('findall', xlate('Loop on all objects'))), 'findobj', '');
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'ExcludeGUI', 'bool', logical(1), xlate('Exclude GUI objects (uicontrol, uimenu,...)'));
    % 21 25
    % 22 25
    % 23 25
    p = rptgen.prop(h, 'SearchTerms', 'string vector', {}, xlate('Search for'));
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    p.Visible = 'off';
    % 31 35
    % 32 35
    % 33 35
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getDialogSchema';'loop_getLoopObjects';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState'});
    % 35 44
    % 36 44
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
end
