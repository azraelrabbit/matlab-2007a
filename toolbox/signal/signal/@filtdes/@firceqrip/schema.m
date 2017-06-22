function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 11
    % 10 11
    c = schema.class(pk, 'firceqrip', findclass(pk, 'abstractSingleOrderMethod'));
    % 12 14
    % 13 14
    p = schema.prop(c, 'stopbandSlope', 'udouble');
    p.FactoryValue = 0.0;
    % 16 17
    p = schema.prop(c, 'minPhase', 'on/off');
    p.FactoryValue = 'off';
end % function
