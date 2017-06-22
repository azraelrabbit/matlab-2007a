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
    c = schema.class(pk, 'ftf', findclass(pk, 'lsl'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'KalmanGain', 'MATLAB array');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    % 19 21
    % 20 21
    p = schema.prop(c, 'ConversionFactor', 'double0t1');
    p.FactoryValue = 1.0;
    % 23 25
    % 24 25
    p = schema.prop(c, 'KalmanGainStates', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_gstates;
end % function
