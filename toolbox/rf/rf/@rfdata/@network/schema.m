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
    h = schema.class(package, 'network', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'Type', 'MATLAB array');
    p.FactoryValue = 'S-Parameters';
    p.Description = 'Type of the Network Parameters';
    p.SetFunction = cellhorzcat(@setnetworkparametertype, 'rf', p, false);
    % 17 19
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 22 24
    p = schema.prop(h, 'Data', 'MATLAB array');
    p.FactoryValue = [0.0 0.0 ;  1.0 0.0];
    p.Description = 'Network parameters';
    p.SetFunction = cellhorzcat(@setcomplexmatrix, 'rf', p, true);
    % 27 29
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Reference impedance';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, false);
end % function
