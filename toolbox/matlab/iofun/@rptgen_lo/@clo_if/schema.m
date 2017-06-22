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
    h = schema.class(pkgLO, 'clo_if', pkgLO.findclass('rpt_if_comp'));
    % 15 17
    % 16 17
    p = rptgen.makeProp(h, 'ConditionalString', 'string', 'true', xlate('Test expression'));
    % 18 21
    % 19 21
    % 20 21
    rptgen.makeStaticMethods(h, {}, {'isTrue'});
    % 22 24
    % 23 24
end % function
