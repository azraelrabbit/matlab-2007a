function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    c = schema.class(findpackage('Simulink'), 'TimeseriesDataConstructor');
    schema.prop(c, 'Constructor', 'MATLAB array');
    schema.prop(c, 'Data', 'MATLAB array');
end % function
