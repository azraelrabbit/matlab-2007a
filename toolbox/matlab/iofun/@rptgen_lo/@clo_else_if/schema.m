function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    pkgLO = findpackage('rptgen_lo');
    % 13 14
    h = schema.class(pkgLO, 'clo_else_if', pkgLO.findclass('clo_if'));
    % 15 17
    % 16 17
    rptgen.makeStaticMethods(h, {}, {});
    % 18 19
end % function
