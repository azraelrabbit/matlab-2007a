function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgRG = findpackage('rptgen');
    pkgSL = findpackage('rptgen_sl');
    % 9 10
    h = schema.class(pkgSL, 'summsrc_sl_blk', pkgRG.findclass('summsrc'));
    % 11 12
end % function
