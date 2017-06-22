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
    h = schema.class(pkgUD, 'cud_prop_loop', pkgUD.findclass('udd_loop'));
    % 11 14
    % 12 14
    p = rptgen.prop(h, 'LoopType', vertcat(cellhorzcat('auto', xlate('All')), cellhorzcat('manual', xlate('Listed'))), 'auto', xlate('Show properties of current context object'));
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    p = rptgen.prop(h, 'ReportedProperties', 'string vector', {}, '');
    % 21 23
    p = rptgen.prop(h, 'UddType', rptgen_ud.enumObjectTypeAuto, 'auto', xlate('Loop on properties of current'));
    % 23 27
    % 24 27
    % 25 27
    p = rptgen.prop(h, 'LocalPropertiesOnly', 'bool', false, xlate('Ignore inherited properties'));
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    p = rptgen.prop(h, 'VisibleOnly', 'bool', logical(1), xlate('Show only visible properties'));
    % 35 38
    % 36 38
    p = rptgen.prop(h, 'PublicGetOnly', 'bool', logical(1), xlate('Show only publicly gettable properties'));
    % 38 41
    % 39 41
    p = rptgen.prop(h, 'PublicSetOnly', 'bool', logical(0), xlate('Show only publicly settable properties'));
    % 41 44
    % 42 44
    p = rptgen.prop(h, 'SerializableOnly', 'bool', logical(0), xlate('Show only serializable properties'));
    % 44 48
    % 45 48
    % 46 48
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getDialogSchema';'loop_getLoopObjects';'loop_getPropSrc'});
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
end
