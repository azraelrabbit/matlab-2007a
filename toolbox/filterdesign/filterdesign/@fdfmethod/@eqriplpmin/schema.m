function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    c = schema.class(pk, 'eqriplpmin', findclass(findpackage('fmethod'), 'eqriplpmin'));
    % 10 11
    p = schema.prop(c, 'MinOrder', 'minorderrestrict');
    % 12 13
    p = schema.prop(c, 'StopbandShape', 'stopbandshapes');
    % 14 15
    p = schema.prop(c, 'StopbandDecay', 'double');
    set(p, 'FactoryValue', 0.0);
end % function
