function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hBasePackage = findpackage('PMDialogs');
    hBaseObj = hBasePackage.findclass('PmGuiObj');
    hCreateInPackage = findpackage('MECH');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'PmMechBranchBarPanel', hBaseObj);
    % 16 18
    % 17 18
    p = schema.prop(hThisClass, 'BlockHandle', 'handle');
    p.Description = 'Handle of the source SL block.';
    p.FactoryValue = 0.0;
    % 21 22
    p = schema.prop(hThisClass, 'NumPorts', 'int');
    p.Description = 'Configurable number of auxilary ports.';
    p.FactoryValue = 0.0;
    % 25 26
    p = schema.prop(hThisClass, 'PortSpinnerLabel', 'string');
    p.Description = 'Text to be displayed as the port spinner label.';
    % 28 30
    % 29 30
    m = schema.method(hThisClass, 'Apply');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 35 36
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 41 42
    m = schema.method(hThisClass, 'getPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array'};
    s.OutputTypes = {'bool','MATLAB array'};
end % function
