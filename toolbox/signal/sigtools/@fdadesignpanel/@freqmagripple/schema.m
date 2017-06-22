function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    pk = findpackage('fdadesignpanel');
    % 7 9
    % 8 9
    c = schema.class(pk, 'freqmagripple', findclass(pk, 'freqvector'));
    % 10 11
    schema.prop(c, 'MagnitudeVector', 'string');
    % 12 13
    schema.prop(c, 'RippleVector', 'string');
end % function
