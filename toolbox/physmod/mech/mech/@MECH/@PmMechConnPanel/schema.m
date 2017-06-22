function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hBasePackage = findpackage('MECH');
    hBaseObj = hBasePackage.findclass('PmMechGuiObj');
    hCreateInPackage = hBasePackage;
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'PmMechConnPanel', hBaseObj);
    % 15 17
    % 16 17
    p = schema.prop(hThisClass, 'BlockHandle', 'handle');
    p.Description = 'Handle of the source SL block.';
    p.FactoryValue = 0.0;
    % 20 21
    p = schema.prop(hThisClass, 'NumPortsParam', 'string');
    p.Description = 'Name of the block parameter holding the number of auxilary ports.';
    p.FactoryValue = '';
    % 24 25
    p = schema.prop(hThisClass, 'NumPorts', 'int');
    p.Description = 'Configurable number of auxilary ports.';
    p.FactoryValue = 0.0;
    % 28 29
    p = schema.prop(hThisClass, 'Enablestatus', 'bool');
    p.Description = 'Holds spinner''s enable status.';
    % 31 32
    p = schema.prop(hThisClass, 'mSpinner', 'handle');
    p.Description = 'Holds spinner control used strictly for rendering.';
    % 34 35
    p = schema.prop(hThisClass, 'PortSpinnerLabel', 'string');
    p.Description = 'Text to be displayed as the port spinner label.';
    % 37 38
    p = schema.prop(hThisClass, 'BaseLabel', 'string');
    p.Description = 'Text to be displayed as the base port label.';
    % 40 41
    p = schema.prop(hThisClass, 'FollowerLabel', 'string');
    p.Description = 'Text to be displayed as the follower port label.';
    % 43 45
    % 44 45
    p = schema.prop(hThisClass, 'BaseDisplay', 'string');
    p.Description = 'Name of the base connection to display.';
    p.FactoryValue = xlate('<not connected>');
    % 48 49
    p = schema.prop(hThisClass, 'FollowerDisplay', 'string');
    p.Description = 'Name of the follower connection to display.';
    p.FactoryValue = xlate('<not connected>');
    % 52 53
    p = schema.prop(hThisClass, 'TestString', 'string');
    p.Description = 'Name of the follower connection to display.';
    p.FactoryValue = xlate('<not connected>');
    % 56 58
    % 57 58
    m = schema.method(hThisClass, 'Apply');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 63 64
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 69 70
    m = schema.method(hThisClass, 'getPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array'};
    s.OutputTypes = {'bool','MATLAB array'};
    % 75 76
    m = schema.method(hThisClass, 'isSpinnerHidden');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
