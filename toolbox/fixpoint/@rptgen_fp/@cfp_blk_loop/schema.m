function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgFP = findpackage('rptgen_fp');
    pkgSL = findpackage('rptgen_sl');
    % 11 12
    h = schema.class(pkgFP, 'cfp_blk_loop', pkgSL.findclass('csl_blk_loop'));
    % 13 15
    % 14 15
    rptgen.makeStaticMethods(h, {}, {'loop_getLoopObjects';'loop_getObjectType';'loop_getPropSrc'});
    % 16 20
    % 17 20
    % 18 20
    % 19 20
end % function
