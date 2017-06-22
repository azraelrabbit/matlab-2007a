function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkgUD = findpackage('rptgen_ud');
    % 9 11
    h = schema.class(pkgUD, 'cud_class_loop', pkgUD.findclass('udd_loop'));
    % 11 14
    % 12 14
    p = rptgen.prop(h, 'LoopType', vertcat(cellhorzcat('auto', xlate('Automatic (from context)')), cellhorzcat('manual', horzcat(xlate('Custom list of classes'), ':'))), 'auto', xlate('Loop on'));
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'ClassList', 'string vector', {'hg.figure','hg.axes'}, '');
    % 21 24
    % 22 24
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getDialogSchema';'loop_getLoopObjects';'loop_getPropSrc'});
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
