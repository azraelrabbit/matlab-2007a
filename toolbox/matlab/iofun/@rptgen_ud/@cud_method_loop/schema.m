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
    h = schema.class(pkgUD, 'cud_method_loop', pkgUD.findclass('udd_loop'));
    % 11 14
    % 12 14
    p = rptgen.prop(h, 'LoopType', vertcat(cellhorzcat('auto', xlate('All')), cellhorzcat('manual', xlate('Listed: '))), 'auto', xlate('Show methods of current context object'));
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'ReportedMethods', 'string vector', {}, '');
    % 21 24
    % 22 24
    p = rptgen.prop(h, 'UddType', rptgen_ud.enumObjectTypeAuto, 'auto', xlate('Loop on methods of current'));
    % 24 27
    % 25 27
    p = rptgen.prop(h, 'LocalMethodsOnly', 'bool', logical(0), xlate('Ignore inherited methods'));
    % 27 31
    % 28 31
    % 29 31
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getDialogSchema';'loop_getLoopObjects';'loop_getPropSrc'});
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
end
