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
    c = schema.class(pk, 'fdaf', findclass(pk, 'abstractfdaf'));
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(c, 'FFTStates', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_states;
end % function
