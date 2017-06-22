function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('RTW');
    hBaseClass = findclass(hCreateInPackage, 'FcnCtl');
    hThisClass = schema.class(hCreateInPackage, 'ModelSpecificCPrototype', hBaseClass);
    % 10 11
    hThisProp = schema.prop(hThisClass, 'Data', 'handle vector');
    hThisProp.FactoryValue = [];
    % 13 16
    % 14 16
    % 15 16
    hThisProp = schema.prop(hThisClass, 'cache', 'RTW.ModelSpecificCPrototype');
    hThisProp.AccessFlags.Serialize = 'off';
    % 18 19
    hThisProp = schema.prop(hThisClass, 'selRow', 'int32');
    hThisProp.FactoryValue = 0.0;
    hThisProp.AccessFlags.Serialize = 'off';
    % 22 24
    % 23 24
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 29 30
    m = schema.method(hThisClass, 'upCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 35 36
    m = schema.method(hThisClass, 'downCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 41 42
    m = schema.method(hThisClass, 'codeConstruction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 47 48
    m = schema.method(hThisClass, 'postApplyCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool','string'};
    % 53 54
    m = schema.method(hThisClass, 'closeCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string'};
    s.OutputTypes = {};
    % 59 60
    m = schema.method(hThisClass, 'validate');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','MATLAB array','string','bool'};
    s.OutputTypes = {'bool','string'};
    % 65 66
    m = schema.method(hThisClass, 'preConfig');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 71 72
    m = schema.method(hThisClass, 'syncWithModel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'MATLAB array'};
    % 77 78
    m = schema.method(hThisClass, 'runValidation');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool','string'};
    % 83 84
    m = schema.method(hThisClass, 'getDefaultConf');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 89 90
    m = schema.method(hThisClass, 'getPortDefaultConf');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','double'};
    s.OutputTypes = {'string','string','string'};
    % 95 96
    m = schema.method(hThisClass, 'addArgConf');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string','string','string'};
    s.OutputTypes = {};
    % 101 102
    m = schema.method(hThisClass, 'getFunctionName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 107 108
    m = schema.method(hThisClass, 'setFunctionName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 113 114
    m = schema.method(hThisClass, 'getArgName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'string'};
    % 119 120
    m = schema.method(hThisClass, 'setArgName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {};
    % 125 126
    m = schema.method(hThisClass, 'getArgCategory');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'string'};
    % 131 132
    m = schema.method(hThisClass, 'setArgCategory');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {};
    % 137 138
    m = schema.method(hThisClass, 'getArgPosition');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'int32'};
    % 143 144
    m = schema.method(hThisClass, 'setArgPosition');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','int32'};
    s.OutputTypes = {};
    % 149 150
    m = schema.method(hThisClass, 'getArgQualifier');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'string'};
    % 155 156
    m = schema.method(hThisClass, 'setArgQualifier');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {};
end % function
