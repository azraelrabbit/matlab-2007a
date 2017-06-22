function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfckt');
    parent = findclass(package, 'rfckt');
    % 8 11
    % 9 11
    h = schema.class(package, 'rlcckt', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'R', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Resistance';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, true, false);
    % 17 19
    p = schema.prop(h, 'L', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Inductance';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, true, false);
    % 22 24
    p = schema.prop(h, 'C', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Capacitance';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, true, false);
end % function
