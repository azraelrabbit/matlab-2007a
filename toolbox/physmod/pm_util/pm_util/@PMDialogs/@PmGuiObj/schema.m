function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('PMDialogs');
    % 9 11
    % 10 11
    hThisClass = schema.class(hCreateInPackage, 'PmGuiObj');
    % 12 14
    % 13 14
    p = schema.prop(hThisClass, 'BlockHandle', 'handle');
    p.Description = 'Handle of the source SL block.';
    p.FactoryValue = 0.0;
    % 17 18
    p = schema.prop(hThisClass, 'Name', 'string');
    p = schema.prop(hThisClass, 'ColSpan', 'MATLAB array');
    p = schema.prop(hThisClass, 'RowSpan', 'MATLAB array');
    p = schema.prop(hThisClass, 'Items', 'PMDialogs.PmGuiObj vector');
    p = schema.prop(hThisClass, 'CreateInstanceFcn', 'handle');
    % 23 24
    p = schema.prop(hThisClass, 'ObjId', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PrivateSet = 'on';
    p.AccessFlags.PrivateGet = 'on';
    % 29 32
    % 30 32
    % 31 32
    m = schema.method(hThisClass, 'Apply');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 37 38
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
    % 43 44
    m = schema.method(hThisClass, 'Realize');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 49 50
    m = schema.method(hThisClass, 'Refresh');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 55 56
    m = schema.method(hThisClass, 'Validate');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'bool','string'};
    % 61 62
    m = schema.method(hThisClass, 'buildFromPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array'};
    s.OutputTypes = {'bool'};
    % 67 68
    m = schema.method(hThisClass, 'getPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array'};
    s.OutputTypes = {'bool','MATLAB array'};
    % 73 74
    m = schema.method(hThisClass, 'getPmSchemaFromChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool','MATLAB array'};
    % 79 80
    m = schema.method(hThisClass, 'buildChildrenFromPmSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array'};
    s.OutputTypes = {'bool'};
    % 85 86
    m = schema.method(hThisClass, 'createInstance');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'handle'};
    % 91 92
    m = schema.method(hThisClass, 'realizeChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 97 98
    m = schema.method(hThisClass, 'refreshChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 103 104
    m = schema.method(hThisClass, 'getDlgSrcObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle'};
    % 109 110
    m = schema.method(hThisClass, 'assignObjId');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    % 114 115
    m = schema.method(hThisClass, 'PreDlgDisplay');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'mxArray'};
end % function
