function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfbase');
    parent = findclass(package, 'rfbase');
    % 8 11
    % 9 11
    h = schema.class(findpackage('rfbbequiv'), 'rfbbequiv', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'MaxLength', 'int32');
    p.FactoryValue = 16.0;
    p.Description = 'FIR Filter Length';
    p.SetFunction = cellhorzcat(@setpositive, 'rfblks', p, false, false, false);
    % 17 19
    p = schema.prop(h, 'Fc', 'MATLAB array');
    p.FactoryValue = 1e+09;
    p.Description = 'Center Frequency';
    p.SetFunction = cellhorzcat(@setpositive, 'rfblks', p, false, false, false);
    % 22 24
    p = schema.prop(h, 'Ts', 'MATLAB array');
    p.FactoryValue = 1e-07;
    p.Description = 'Sample Time';
    p.SetFunction = cellhorzcat(@setpositive, 'rfblks', p, false, false, false);
    % 27 29
    p = schema.prop(h, 'ImpulseResp', 'MATLAB array');
    p.FactoryValue = 1.0;
    p.Description = 'Impulse Response';
    p.Visible = 'Off';
    % 32 34
    p = schema.prop(h, 'Delay', 'int32');
    p.FactoryValue = 0.0;
    p.Description = 'Delay';
    p.Visible = 'Off';
    % 37 39
    p = schema.prop(h, 'Seed', 'int32');
    p.FactoryValue = 67987.0;
    p.Description = 'Seed';
    p.SetFunction = cellhorzcat(@setpositive, 'rfblks', p, false, false, false);
    p.Visible = 'off';
    % 43 45
    p = schema.prop(h, 'NoiseFlag', 'MATLAB array');
    p.FactoryValue = 'off';
    p.Description = 'Noise flag';
    p.SetFunction = cellhorzcat(@setnoiseflag, p);
    p.Visible = 'Off';
end % function
