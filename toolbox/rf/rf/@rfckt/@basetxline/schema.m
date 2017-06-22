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
    h = schema.class(package, 'basetxline', parent);
    % 11 14
    % 12 14
    if isempty(findtype('StubModeTypeDATATYPE'))
        schema.EnumType('StubModeTypeDATATYPE', {'None','Series','Shunt'});
    end % if
    % 16 18
    if isempty(findtype('TerminationTypeDATATYPE'))
        schema.EnumType('TerminationTypeDATATYPE', {'None','Open','Short'});
    end % if
    % 20 23
    % 21 23
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.AccessFlags.PublicSet = 'Off';
    p.FactoryValue = [];
    p.Description = 'Characteristic impedance';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, true);
    p.Visible = 'off';
    % 28 30
    p = schema.prop(h, 'PV', 'MATLAB array');
    p.AccessFlags.PublicSet = 'Off';
    p.FactoryValue = [];
    p.Description = 'Phase velocity';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, false, false, true);
    p.Visible = 'off';
    % 35 37
    p = schema.prop(h, 'Loss', 'MATLAB array');
    p.AccessFlags.PublicSet = 'Off';
    p.FactoryValue = [];
    p.Description = 'Loss';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    p.Visible = 'off';
    % 42 44
    p = schema.prop(h, 'LineLength', 'MATLAB array');
    p.FactoryValue = .01;
    p.Description = 'Transmission line length';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, false, false, false);
    % 47 49
    p = schema.prop(h, 'StubMode', 'StubModeTypeDATATYPE');
    p.FactoryValue = 'None';
    p.Description = 'Stub mode';
    % 51 53
    p = schema.prop(h, 'Termination', 'TerminationTypeDATATYPE');
    p.FactoryValue = 'None';
    p.Description = 'Termination of stub';
end % function
