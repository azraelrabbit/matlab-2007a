function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('adaptfilt');
    % 9 11
    % 10 11
    c = schema.class(pk, 'ap', findclass(pk, 'bap'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'ErrorStates', 'MATLAB array');
    p.Description = 'capture';
    p.SetFunction = @set_errstates;
    % 19 21
    % 20 21
    p = schema.prop(c, 'EpsilonStates', 'MATLAB array');
    p.Description = 'capture';
    p.SetFunction = @set_epsstates;
end % function
