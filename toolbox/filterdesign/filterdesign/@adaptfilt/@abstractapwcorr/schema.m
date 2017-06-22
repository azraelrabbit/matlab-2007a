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
    c = schema.class(pk, 'abstractapwcorr', findclass(pk, 'abstractap'));
    set(c, 'Description', 'abstract');
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'CorrelationCoeffs', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_corrcoeffs;
    % 20 22
    % 21 22
    p = schema.prop(c, 'ErrorStates', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_errstates;
    % 25 27
    % 26 27
    p = schema.prop(c, 'EpsilonStates', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_epsstates;
end % function
