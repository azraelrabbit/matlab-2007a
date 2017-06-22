function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen');
    % 8 9
    h = schema.class(pkg, 'rpt_looper', pkg.findclass('rpt_section'));
    % 10 11
    p = rptgen.prop(h, 'ObjectSection', 'bool', false, xlate('Create section for each object in loop'));
    % 12 14
    % 13 14
    p = rptgen.prop(h, 'ShowTypeInTitle', 'bool', false, xlate('Display the object type in the section title'));
    % 15 17
    % 16 17
    p = rptgen.prop(h, 'ObjectAnchor', 'bool', false, xlate('Create link anchor for each object in loop'));
    % 18 21
    % 19 21
    % 20 21
    p = rptgen.prop(h, 'RuntimeLoopObjects', 'MATLAB array', [], '', 2.0);
    % 22 24
    % 23 24
    p = rptgen.prop(h, 'RuntimeCurrentObject', 'MATLAB array', [], '', 2.0);
    % 25 27
    % 26 27
    rptgen.makeStaticMethods(h, {'loop_getDescription'}, {'getSectionType';'loop_getDialogSchema';'loop_getContextString';'loop_getLoopObjects';'loop_getObjectLinkID';'loop_getObjectName';'loop_getObjectType';'loop_getPropSrc';'loop_restoreState';'loop_saveState';'loop_setState';'loop_makeSection';'loop_closeSection';'mcodeConstructor';'dlgSectionOptions'});
    % 28 45
    % 29 45
    % 30 45
    % 31 45
    % 32 45
    % 33 45
    % 34 45
    % 35 45
    % 36 45
    % 37 45
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
end % function
