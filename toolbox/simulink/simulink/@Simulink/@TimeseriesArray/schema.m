function schema
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    p = findpackage('Simulink');
    c = schema.class(p, 'TimeseriesArray', findclass(findpackage('tsdata'), 'timeseriesArray'));
    % 17 20
    % 18 20
    % 19 20
    schema.prop(c, 'Dataconstructor', 'MATLAB array');
end % function
