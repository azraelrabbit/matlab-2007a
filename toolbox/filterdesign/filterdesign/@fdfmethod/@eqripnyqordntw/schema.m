function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('fdfmethod');
    c = schema.class(pk, 'eqripnyqordntw', findclass(findpackage('fmethod'), 'abstracteqrip'));
    % 11 13
    % 12 13
    p = schema.prop(c, 'StopbandShape', 'limitedstopbandshapes');
    % 14 15
    p = schema.prop(c, 'StopbandDecay', 'double');
    set(p, 'FactoryValue', 0.0);
end % function
