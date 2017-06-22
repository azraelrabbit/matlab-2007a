function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    parent = findclass(pk, 'abstractlpnorm');
    c = schema.class(pk, 'lpnormmultiband2', parent);
    % 11 12
    p = schema.prop(c, 'B1Weights', 'double_vector');
    p = schema.prop(c, 'B2Weights', 'double_vector');
    p = schema.prop(c, 'B3Weights', 'double_vector');
    p = schema.prop(c, 'B4Weights', 'double_vector');
    p = schema.prop(c, 'B5Weights', 'double_vector');
    p = schema.prop(c, 'B6Weights', 'double_vector');
    p = schema.prop(c, 'B7Weights', 'double_vector');
    p = schema.prop(c, 'B8Weights', 'double_vector');
    p = schema.prop(c, 'B9Weights', 'double_vector');
    p = schema.prop(c, 'B10Weights', 'double_vector');
end % function
