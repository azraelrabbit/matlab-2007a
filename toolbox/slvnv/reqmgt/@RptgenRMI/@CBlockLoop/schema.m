function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgRMI = findpackage('RptgenRMI');
    pkgSL = findpackage('rptgen_sl');
    % 11 12
    h = schema.class(pkgRMI, 'CBlockLoop', pkgSL.findclass('csl_blk_loop'));
    % 13 15
    % 14 15
    rptgen.makeStaticMethods(h, {}, {'loop_getLoopObjects'});
    % 16 18
    % 17 18
end % function
