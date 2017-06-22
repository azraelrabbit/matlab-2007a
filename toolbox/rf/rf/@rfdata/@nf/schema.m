function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfdata');
    parent = findclass(package, 'rfdata');
    % 8 11
    % 9 11
    h = schema.class(package, 'nf', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 17 19
    p = schema.prop(h, 'Data', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Noise Figure (dB)';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, false);
    % 22 24
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Reference impedance';
    p.SetFunction = cellhorzcat(@setcomplex, 'rf', p, false);
    p.Visible = 'off';
end % function
