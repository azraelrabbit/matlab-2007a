function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigdatatypes');
    % 9 10
    cEventData = findclass(findpackage('handle'), 'EventData');
    % 11 12
    c = schema.class(pk, 'sigeventdata', cEventData);
    % 13 15
    % 14 15
    schema.prop(c, 'Data', 'MATLAB array');
end % function
