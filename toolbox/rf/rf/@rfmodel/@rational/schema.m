function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('rfmodel');
    parent = findclass(package, 'rfmodel');
    % 8 11
    % 9 11
    h = schema.class(package, 'rational', parent);
    % 11 13
    p = schema.prop(h, 'A', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Poles';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, true);
    % 16 18
    p = schema.prop(h, 'C', 'MATLAB array');
    p.FactoryValue = [];
    p.Description = 'Residues';
    p.SetFunction = cellhorzcat(@setcomplexvector, 'rf', p, true);
    % 21 23
    p = schema.prop(h, 'D', 'double');
    p.FactoryValue = 0.0;
    p.Description = 'Constant term';
    % 25 27
    p = schema.prop(h, 'E', 'double');
    p.FactoryValue = 0.0;
    p.Description = '';
    p.Visible = 'off';
    % 30 32
    p = schema.prop(h, 'Delay', 'double');
    p.FactoryValue = 0.0;
    p.Description = 'Delay';
    p.SetFunction = cellhorzcat(@setpositive, 'rf', p, true, false, false);
end % function
