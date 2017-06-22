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
    c = schema.class(pk, 'abstractfdaf', findclass(pk, 'adaptfilt'));
    c.Description = 'abstract';
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'StepSize', 'double0t1');
    p.FactoryValue = 1.0;
    % 18 20
    % 19 20
    p = schema.prop(c, 'Leakage', 'double0t1');
    p.FactoryValue = 1.0;
    % 22 24
    % 23 24
    p = schema.prop(c, 'Power', 'double_vector');
    p.Description = 'capture';
    p.SetFunction = @set_pwr;
    % 27 29
    % 28 29
    p = schema.prop(c, 'AvgFactor', 'double0t1');
    p.FactoryValue = .9;
    % 31 33
    % 32 33
    p = schema.prop(c, 'BlockLength', 'spt_uint32');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'off';
    % 36 38
    % 37 38
    p = schema.prop(c, 'Offset', 'udouble');
    p.FactoryValue = 0.0;
    % 40 42
    % 41 42
    p = schema.prop(c, 'FFTCoefficients', 'MATLAB array');
    p.Description = 'capture';
    p.SetFunction = @set_fftcoeffs;
end % function
