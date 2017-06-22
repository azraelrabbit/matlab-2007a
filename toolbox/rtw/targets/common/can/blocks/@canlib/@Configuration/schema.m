function schema
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    pk = findpackage('canlib');
    c = schema.class(pk, 'Configuration');
    % 8 10
    % 9 10
    p = schema.prop(c, 'total_num_odts', 'double');
end % function
