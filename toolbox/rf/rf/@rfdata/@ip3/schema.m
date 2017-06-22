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
    h = schema.class(package, 'ip3', parent);
    % 11 14
    % 12 14
    if isempty(findtype('IP3TypeDATATYPE'))
        schema.EnumType('IP3TypeDATATYPE', {'OIP3','IIP3'});
    end % if
    % 16 19
    % 17 19
    p = schema.prop(h, 'Type', 'IP3TypeDATATYPE');
    p.FactoryValue = 'OIP3';
    p.Description = 'Type of Data Object';
    % 21 23
    p = schema.prop(h, 'Freq', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Frequency';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, true, false, true);
    % 26 28
    p = schema.prop(h, 'Data', 'MATLAB array');
    p.FactoryValue = Inf;
    p.Description = 'IIP3 or OIP3';
    p.SetFunction = cellhorzcat(@setpositivevector, 'rf', p, false, true, false);
    % 31 33
    p = schema.prop(h, 'Z0', 'MATLAB array');
    p.FactoryValue = 50.0;
    p.Description = 'Reference Impedance';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, false);
    p.Visible = 'off';
end % function
