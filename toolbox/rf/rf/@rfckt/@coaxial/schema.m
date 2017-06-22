function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfckt');
    parent = findclass(package, 'basetxline');
    % 8 11
    % 9 11
    h = schema.class(package, 'coaxial', parent);
    % 11 14
    % 12 14
    p = schema.prop(h, 'OuterRadius', 'MATLAB array');
    p.FactoryValue = .00257;
    p.Description = 'Outer radius';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 17 19
    p = schema.prop(h, 'InnerRadius', 'MATLAB array');
    p.FactoryValue = .000725;
    p.Description = 'Inner radius';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 22 24
    p = schema.prop(h, 'MuR', 'MATLAB array');
    p.FactoryValue = 1.0;
    p.Description = 'Relative permeability constant';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 27 29
    p = schema.prop(h, 'EpsilonR', 'MATLAB array');
    p.FactoryValue = 2.3;
    p.Description = 'Relative permittivity constant';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 32 34
    p = schema.prop(h, 'SigmaCond', 'MATLAB array');
    p.FactoryValue = Inf;
    p.Description = 'Conductivity in conductor';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, true, false);
    % 37 39
    p = schema.prop(h, 'SigmaDiel', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Conductivity in dielectric';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, false, false);
end % function
