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
    h = schema.class(pkgUD, 'cud_pkg_loop', pkgUD.findclass('udd_loop'));
    % 11 14
    % 12 14
    p = rptgen.prop(h, 'LoopType', vertcat(cellhorzcat('directory', xlate('All packages in directory:')), cellhorzcat('manual', xlate('Listed packages:'))), 'directory', xlate('Loop on'));
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    p = rptgen.prop(h, 'DirectoryName', rptgen.makeStringType, '%<pwd>', '');
    % 23 26
    % 24 26
    p = rptgen.prop(h, 'PackageList', 'string vector', {}, '');
    % 26 29
    % 27 29
    rptgen.makeStaticMethods(h, {}, {'loop_getContextString';'loop_getDialogSchema';'loop_getLoopObjects';'loop_getPropSrc'});
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
