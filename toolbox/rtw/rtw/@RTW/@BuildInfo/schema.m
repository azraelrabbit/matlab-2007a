function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hCreateInPackage = findpackage('RTW');
    hBaseClass = findclass(hCreateInPackage, 'BuildInfoBuildObj');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'BuildInfo', hBaseClass);
    % 16 18
    % 17 18
    hThisProp = schema.prop(hThisClass, 'ModelHandle', 'double');
    hThisProp.FactoryValue = 0.0;
    hThisProp = schema.prop(hThisClass, 'ModelName', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'Viewer', 'handle');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'Options', 'handle');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'Tokens', 'handle vector');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'BuildArgs', 'handle vector');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'MakeArgs', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'TargetPrecompLibLoc', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'TargetLibSuffix', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'InstallDirmexopts', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'LinkObj', 'handle vector');
    hThisProp.FactoryValue = [];
    % 40 41
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 46 47
    m = schema.method(hThisClass, 'areChildrenOrdered');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 52 53
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 58 59
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 64 65
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
