function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hDeriveFromPackage = findpackage('DAStudio');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'Object');
    hCreateInPackage = findpackage('Simulink');
    % 12 14
    % 13 14
    hThisClass = schema.class(hCreateInPackage, 'ModelAdvisor', hDeriveFromClass);
    % 15 18
    % 16 18
    % 17 18
    hThisProp = schema.prop(hThisClass, 'AtticData', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 20 22
    % 21 22
    hThisProp = schema.prop(hThisClass, 'CheckCellArray', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 24 26
    % 25 26
    hThisProp = schema.prop(hThisClass, 'TaskCellArray', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 28 30
    % 29 30
    hThisProp = schema.prop(hThisClass, 'TaskAdvisorCellArray', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 32 34
    % 33 34
    hThisProp = schema.prop(hThisClass, 'TaskAdvisorRoot', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 36 37
    hThisProp = schema.prop(hThisClass, 'NOBROWSER', 'bool');
    hThisProp.FactoryValue = false;
    % 39 41
    % 40 41
    hThisProp = schema.prop(hThisClass, 'ShowWarnDialog', 'bool');
    hThisProp.FactoryValue = true;
    % 43 45
    % 44 45
    hThisProp = schema.prop(hThisClass, 'ShowSourceTab', 'bool');
    hThisProp.FactoryValue = false;
    % 47 49
    % 48 49
    hThisProp = schema.prop(hThisClass, 'MEMenus', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 51 53
    % 52 53
    hThisProp = schema.prop(hThisClass, 'BrowserWindow', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 55 57
    % 56 57
    hThisProp = schema.prop(hThisClass, 'MAExplorer', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 59 61
    % 60 61
    hThisProp = schema.prop(hThisClass, 'ListExplorer', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 63 65
    % 64 65
    hThisProp = schema.prop(hThisClass, 'BaselineMode', 'bool');
    hThisProp.FactoryValue = false;
    % 67 69
    % 68 69
    hThisProp = schema.prop(hThisClass, 'StartInTaskPage', 'bool');
    hThisProp.FactoryValue = false;
    % 71 73
    % 72 73
    hThisProp = schema.prop(hThisClass, 'ActiveCheckID', 'int32');
    hThisProp.FactoryValue = 0.0;
    % 75 77
    % 76 77
    hThisProp = schema.prop(hThisClass, 'Stage', 'string');
    hThisProp.FactoryValue = '';
    % 79 81
    % 80 81
    hThisProp = schema.prop(hThisClass, 'System', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 83 84
    hThisProp = schema.prop(hThisClass, 'ModelName', 'string');
    hThisProp.GetFunction = @getModelName;
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'URL', 'string');
    hThisProp.FactoryValue = '';
    % 90 93
    % 91 93
    % 92 93
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 98 99
    m = schema.method(hThisClass, 'getFullName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 104 105
    m = schema.method(hThisClass, 'getDisplayIcon');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 110 111
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 116 117
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 122 123
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 128 130
    % 129 130
    m = schema.method(hThisClass, 'getModelAdvisor', 'static');
    s = m.Signature;
    s.varargin = 'on';
    s.InputTypes = {'mxArray'};
    s.OutputTypes = {'mxArray'};
    % 135 137
    % 136 137
    m = schema.method(hThisClass, 'reportExists', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'mxArray'};
    s.OutputTypes = {'mxArray'};
    % 142 144
    % 143 144
    m = schema.method(hThisClass, 'getActiveModelAdvisorObj', 'static');
    s = m.Signature;
    s.varargin = 'on';
    s.InputTypes = {'mxArray'};
    s.OutputTypes = {'mxArray'};
end % function
function valueToCaller = getModelName(obj, valueStored)
    valueToCaller = obj.getFullName;
end % function
