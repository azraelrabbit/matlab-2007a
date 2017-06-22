function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkgLO = findpackage('rptgen_lo');
    % 10 11
    h = schema.class(pkgLO, 'clo_else', pkgLO.findclass('rpt_if_comp'));
    % 12 14
    % 13 14
    rptgen.makeStaticMethods(h, {}, {});
    % 15 16
end % function
