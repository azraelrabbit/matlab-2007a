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
    pkgRG = findpackage('rptgen');
    % 11 12
    h = schema.class(pkgLO, 'clo_while', pkgRG.findclass('rptcomponent'));
    % 13 14
    p = rptgen.makeProp(h, 'EvalInitString', 'string', '', xlate('Initialize with this expression'));
    % 15 17
    % 16 17
    p = rptgen.makeProp(h, 'ConditionalString', 'string', 'false', xlate('Continue looping if this expression is true'));
    % 18 20
    % 19 20
    p = rptgen.makeProp(h, 'isMaxIterations', 'bool', true, xlate('Limit number of loops to: '));
    % 21 23
    % 22 23
    p = rptgen.makeProp(h, 'MaxIterations', 'double', 100.0, '');
    % 24 26
    % 25 26
    rptgen.makeStaticMethods(h, {}, {'isTrue'});
    % 27 29
    % 28 29
end % function
