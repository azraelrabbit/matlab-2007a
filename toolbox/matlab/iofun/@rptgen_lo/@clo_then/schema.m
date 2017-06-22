function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    pkgLO = findpackage('rptgen_lo');
    % 12 13
    h = schema.class(pkgLO, 'clo_then', pkgLO.findclass('rpt_if_comp'));
    % 14 16
    % 15 16
    rptgen.makeStaticMethods(h, {}, {});
    % 17 18
end % function
