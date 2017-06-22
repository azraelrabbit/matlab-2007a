function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgUD = findpackage('rptgen_ud');
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkgUD, 'udd_loop', pkgRG.findclass('rpt_looper'));
    % 13 15
    % 14 15
    rptgen.makeStaticMethods(h, {}, {'loop_restoreState';'loop_setState';'loop_saveState'});
    % 16 20
    % 17 20
    % 18 20
    % 19 20
end % function
