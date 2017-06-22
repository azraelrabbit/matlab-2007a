function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('spcuddutils');
    c = schema.class(pk, 'EventData', findclass(findpackage('handle'), 'EventData'));
    % 10 11
    schema.prop(c, 'Data', 'mxArray');
end % function
