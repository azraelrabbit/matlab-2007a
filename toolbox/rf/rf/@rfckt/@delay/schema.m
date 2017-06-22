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
    h = schema.class(package, 'delay', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Characteristic impedance';
    p.SetFunction = cellhorzcat(@setcomplex, 'rf', p, false);
    % 17 19
    p = schema.prop(h, 'Loss', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Line loss';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, false, false);
    % 22 24
    p = schema.prop(h, 'TimeDelay', 'MATLAB array');
    p.FactoryValue = 1e-12;
    p.Description = 'Time delay';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, false, false);
end % function
