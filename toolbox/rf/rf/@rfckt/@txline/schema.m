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
    h = schema.class(package, 'txline', parent);
    % 11 14
    % 12 14
    if isempty(findtype('StubModeTypeDATATYPE'))
        schema.EnumType('StubModeTypeDATATYPE', {'None','Series','Shunt'});
    end % if
    % 16 18
    if isempty(findtype('TerminationTypeDATATYPE'))
        schema.EnumType('TerminationTypeDATATYPE', {'None','Open','Short'});
    end % if
    % 20 22
    if isempty(findtype('InterpolationMethodDATATYPE'))
        schema.EnumType('InterpolationMethodDATATYPE', {'Linear','Cubic','Spline'});
    end % if
    % 24 27
    % 25 27
    p = schema.prop(h, 'LineLength', 'MATLAB array');
    p.FactoryValue = .01;
    p.Description = 'Transmission line length';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 30 32
    p = schema.prop(h, 'StubMode', 'StubModeTypeDATATYPE');
    p.FactoryValue = 'None';
    p.Description = 'Stub mode';
    % 34 36
    p = schema.prop(h, 'Termination', 'TerminationTypeDATATYPE');
    p.FactoryValue = 'None';
    p.Description = 'Termination of stub';
    % 38 40
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = 1e+09;
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 43 45
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Characteristic impedance';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, false);
    % 48 50
    p = schema.prop(h, 'PV', 'MATLAB array');
    p.FactoryValue = 299792458.0;
    p.Description = 'Phase velocity';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, false, false, false);
    % 53 55
    p = schema.prop(h, 'Loss', 'MATLAB array');
    p.FactoryValue = 0.0;
    p.Description = 'Loss';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, false);
    % 58 60
    p = schema.prop(h, 'IntpType', 'InterpolationMethodDATATYPE');
    p.FactoryValue = 'Linear';
    p.Description = 'Interpolation type';
end % function
