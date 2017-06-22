function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspdata');
    c = schema.class(pk, 'metadata');
    % 10 12
    % 11 12
    p = schema.prop(c, 'DataUnits', 'String');
end % function
