function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    p = findpackage('Simulink');
    c = schema.class(p, 'RegionInfo');
    % 10 12
    % 11 12
    schema.prop(c, 'StartIndex', 'int32');
    schema.prop(c, 'NumElements', 'int32');
end % function
