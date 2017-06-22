function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('RTW');
    hPackage = findpackage('DAStudio');
    hBaseClass = findclass(hPackage, 'Object');
    hThisClass = schema.class(hCreateInPackage, 'FcnCtl', hBaseClass);
    % 11 13
    % 12 13
    hThisProp = schema.prop(hThisClass, 'Name', 'string');
    hThisProp.FactoryValue = 'FunctionControl';
    % 15 17
    % 16 17
    hThisProp = schema.prop(hThisClass, 'ArgSpecData', 'handle vector');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'ViewWidget', 'handle');
    hThisProp.FactoryValue = [];
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp = schema.prop(hThisClass, 'ModelHandle', 'double');
    hThisProp.FactoryValue = 0.0;
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp = schema.prop(hThisClass, 'FunctionName', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'Description', 'string');
    hThisProp.FactoryValue = '';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp = schema.prop(hThisClass, 'PreConfigFlag', 'bool');
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp = schema.prop(hThisClass, 'RightClickBuild', 'bool');
    hThisProp.FactoryValue = false;
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp = schema.prop(hThisClass, 'SubsysBlockHdl', 'double');
    hThisProp.FactoryValue = -1.0;
    hThisProp.AccessFlags.Serialize = 'off';
    % 38 40
    % 39 40
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 45 47
    % 46 47
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 52 54
    % 53 54
    m = schema.method(hThisClass, 'codeConstruction');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 59 61
    % 60 61
    m = schema.method(hThisClass, 'validate');
    s = m.Signature;
    s.varargin = 'off';
    % 64 65
    s.InputTypes = {'handle','MATLAB array','string','MATLAB array'};
    s.OutputTypes = {'bool','string'};
    % 67 69
    % 68 69
    m = schema.method(hThisClass, 'postApplyCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool','string'};
    % 74 75
    m = schema.method(hThisClass, 'closeCB');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string'};
    s.OutputTypes = {};
    % 80 83
    % 81 83
    % 82 83
    m = schema.method(hThisClass, 'preConfig');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
end % function
