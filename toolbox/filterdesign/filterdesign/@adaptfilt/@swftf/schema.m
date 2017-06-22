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
    c = schema.class(pk, 'swftf', findclass(pk, 'adaptdffir'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'BlockLength', 'spt_uint32');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.SetFunction = @set_blocklen;
    % 20 21
    p = schema.prop(c, 'InitFactor', 'udouble');
    p.FactoryValue = 1.0;
    % 23 25
    % 24 25
    p = schema.prop(c, 'KalmanGain', 'MATLAB array');
    p.SetFunction = @set_kalmangain;
    % 27 29
    % 28 29
    p = schema.prop(c, 'ConversionFactor', 'double_vector');
    p.FactoryValue = [1.0 -1.0];
    p.SetFunction = @set_gamma;
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(c, 'FwdPrediction', 'MATLAB array');
    p.Description = 'capture';
    p.SetFunction = @set_fwd;
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(c, 'BkwdPrediction', 'MATLAB array');
    p.Description = 'capture';
    p.SetFunction = @set_bwd;
    % 46 48
    % 47 48
    p = schema.prop(c, 'DesiredSignalStates', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_dstates;
    % 51 53
    % 52 53
    p = schema.prop(c, 'KalmanGainStates', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_gstates;
end % function
