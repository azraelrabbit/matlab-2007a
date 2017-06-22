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
    h = schema.class(package, 'rlcgline', parent);
    % 11 14
    % 12 14
    if isempty(findtype('InterpolationMethodDATATYPE'))
        schema.EnumType('InterpolationMethodDATATYPE', {'Linear','Cubic','Spline'});
    end % if
    % 16 19
    % 17 19
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = 1e+09;
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 22 24
    p = schema.prop(h, 'R', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Resistance per length';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, false);
    % 27 29
    p = schema.prop(h, 'L', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Inductance per length';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, false);
    % 32 34
    p = schema.prop(h, 'C', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Capacitance per length';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, false);
    % 37 39
    p = schema.prop(h, 'G', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Conductance per length';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, false);
    % 42 44
    p = schema.prop(h, 'IntpType', 'InterpolationMethodDATATYPE');
    p.FactoryValue = 'Linear';
    p.Description = 'Interpolation type';
end % function
