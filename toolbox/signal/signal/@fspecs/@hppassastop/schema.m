function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    parent = findclass(pk, 'hppass');
    c = schema.class(pk, 'hppassastop', parent);
    % 11 12
    p = schema.prop(c, 'Astop', 'posdouble');
    p.FactoryValue = 60.0;
end % function
