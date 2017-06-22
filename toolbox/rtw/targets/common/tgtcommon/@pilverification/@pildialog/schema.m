function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    parentPkg = findpackage('Simulink');
    parent = findclass(parentPkg, 'SLDialogSource');
    package = findpackage('pilverification');
    hThisClass = schema.class(package, 'pildialog', parent);
    % 13 16
    % 14 16
    % 15 16
    schema.prop(hThisClass, 'Block', 'handle');
    % 17 18
    schema.prop(hThisClass, 'Root', 'Simulink.BlockDiagram');
    % 19 21
    % 20 21
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 26 27
    m = schema.method(hThisClass, 'selectAlgCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 32 33
    m = schema.method(hThisClass, 'buildAppCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 38 39
    m = schema.method(hThisClass, 'helpCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 44 45
    m = schema.method(hThisClass, 'downloadAppCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 50 51
    m = schema.method(hThisClass, 'pilConfigCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 56 58
    % 57 58
    hThisProp = schema.prop(hThisClass, 'PILConfiguration', 'string');
    hThisProp.getFunction = @getFunctionPILConfiguration;
    hThisProp.setFunction = @setFunctionPILConfiguration;
    % 61 62
    hThisProp = schema.prop(hThisClass, 'SystemPath', 'string');
    hThisProp.getFunction = @getFunctionSystemPath;
    hThisProp.setFunction = @setFunctionSystemPath;
    % 65 67
    % 66 67
    hThisProp = schema.prop(hThisClass, 'status', 'string');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = '';
end % function
function newvalue = setFunctionPILConfiguration(this, newvalue)
    % 74 75
    this.Block.PILConfiguration = newvalue;
end % function
function value = getFunctionPILConfiguration(this, value)
    % 78 79
    value = this.Block.PILConfiguration;
end % function
function newvalue = setFunctionSystemPath(this, newvalue)
    % 82 83
    this.Block.SystemPath = newvalue;
end % function
function value = getFunctionSystemPath(this, value)
    % 86 87
    value = this.Block.SystemPath;
end % function
