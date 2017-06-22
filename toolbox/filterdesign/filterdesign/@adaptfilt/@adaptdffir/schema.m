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
    c = schema.class(pk, 'adaptdffir', findclass(pk, 'adaptfilt'));
    c.Description = 'abstract';
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'Coefficients', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_coeffs;
    p.GetFunction = @get_coeffs;
    % 21 23
    % 22 23
    p = schema.prop(c, 'States', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_states;
    p.GetFunction = @get_states;
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    p = schema.prop(c, 'privStates', 'MATLAB array');
    p.AccessFlag.PublicGet = 'off';
    p.AccessFlag.PublicSet = 'off';
    % 37 38
    p = schema.prop(c, 'privCoefficients', 'MATLAB array');
    p.AccessFlag.PublicGet = 'off';
    p.AccessFlag.PublicSet = 'off';
end % function
