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
    h = schema.class(pkgUD, 'cud_obj_loop', pkgUD.findclass('udd_loop'));
    % 11 15
    % 12 15
    % 13 15
    p = rptgen.prop(h, 'ObjectSource', vertcat(cellhorzcat('workspace', xlate('Objects in workspace')), cellhorzcat('matfile', xlate('Objects in MAT file')), cellhorzcat('loopchild', xlate('Children of current object')), cellhorzcat('direct', xlate('Objects set in RuntimeCurrentObject'))), 'workspace', xlate('Loop on'));
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    p = rptgen.prop(h, 'Filename', rptgen.makeStringType, 'matlab.mat', xlate('MAT file name'));
    % 24 28
    % 25 28
    % 26 28
    p = rptgen.prop(h, 'RuntimeCurrentObject', 'handle vector', [], xlate('Search root when ObjectSource=''loopchild'' or list of objects for ''direct'''), 2.0);
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    p = rptgen.prop(h, 'NameList', 'string vector', {}, xlate('Only include variables with name(s)'));
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    p = rptgen.prop(h, 'ExcludeRoot', 'bool', logical(1), xlate('Exclude current object from loop'));
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    p = rptgen.prop(h, 'FindArguments', 'string vector', {}, xlate('Search terms'));
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getDialogSchema';'loop_getLoopObjects';'loop_getPropSrc'});
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
end
