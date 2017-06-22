function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfbbequiv');
    parent = findclass(package, 'linear');
    % 8 10
    h = schema.class(package, 'nonlinear', parent);
    % 10 13
    % 11 13
    p = schema.prop(h, 'Method', 'int32');
    p.FactoryValue = 0.0;
    p.Description = 'Method';
    p.Visible = 'Off';
    % 16 18
    p = schema.prop(h, 'InputEffect', 'double');
    p.FactoryValue = 1.0;
    p.Description = 'Input Gain';
    p.Visible = 'Off';
    % 21 23
    p = schema.prop(h, 'OutputGain', 'MATLAB array');
    p.FactoryValue = 1.0;
    p.Description = 'Output Gain';
    p.SetFunction = cellhorzcat(@setcomplex, 'rfblks', p, false);
    p.Visible = 'Off';
    % 27 29
    p = schema.prop(h, 'XData', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'X Data';
    p.SetFunction = cellhorzcat(@setrealvector, 'rfblks', p, true, true, true);
    p.Visible = 'Off';
    % 33 35
    p = schema.prop(h, 'AMAMData', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'AMAM Data';
    p.SetFunction = cellhorzcat(@setrealvector, 'rfblks', p, true, true, true);
    p.Visible = 'Off';
    % 39 41
    p = schema.prop(h, 'AMPMData', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'AMPM Data';
    p.SetFunction = cellhorzcat(@setrealvector, 'rfblks', p, true, true, true);
    p.Visible = 'Off';
    % 45 47
    p = schema.prop(h, 'PhaseNoiseResp', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Phase Noise';
    p.Visible = 'Off';
    % 50 52
    p = schema.prop(h, 'Poly5C1', 'double');
    p.FactoryValue = 1.0;
    p.Description = 'C1 coefficient of 5th order polynomial';
    p.Visible = 'Off';
    % 55 57
    p = schema.prop(h, 'Poly5C3', 'double');
    p.FactoryValue = 1.0;
    p.Description = 'C3 coefficient of 5th order polynomial';
    p.Visible = 'Off';
    % 60 62
    p = schema.prop(h, 'Poly5C5', 'double');
    p.FactoryValue = 1.0;
    p.Description = 'C5 coefficient of 5th order polynomial';
    p.Visible = 'Off';
    % 65 67
    p = schema.prop(h, 'ASatIn', 'double');
    p.FactoryValue = 1.0;
    p.Description = 'Input amplitude at saturation';
    p.Visible = 'Off';
    % 70 72
    p = schema.prop(h, 'ASatOut', 'double');
    p.FactoryValue = 1.0;
    p.Description = 'Output amplitude at saturation';
    p.Visible = 'Off';
    % 75 77
    p = schema.prop(h, 'P2DTF', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Transfer function look-up table for P2D data';
    p.Visible = 'Off';
    % 80 82
    p = schema.prop(h, 'P2DAM', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Input amplitude for P2D data';
    p.Visible = 'Off';
    % 85 87
    p = schema.prop(h, 'P2DIFFTLength', 'double');
    p.FactoryValue = 16.0;
    p.Description = 'IFFT length used in P2D simulation';
    p.Visible = 'Off';
end % function
