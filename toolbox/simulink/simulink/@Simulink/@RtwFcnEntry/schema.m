function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mlock;
    % 10 11
    hCreateInPackage = findpackage('Simulink');
    % 12 14
    % 13 14
    hDeriveFromPackageDAS = findpackage('DAStudio');
    hDeriveFromClassDAS = findclass(hDeriveFromPackageDAS, 'Object');
    % 16 18
    % 17 18
    hThisClass = schema.class(hCreateInPackage, 'RtwFcnEntry', hDeriveFromClassDAS);
    % 19 21
    % 20 21
    hThisProp = schema.prop(hThisClass, 'FcnName', 'string');
    % 22 23
    dataTypeProps = rtwmath_data_type_prop_list;
    % 24 25
    for prop=dataTypeProps
        hThisProp = schema.prop(hThisClass, prop{1.0}, 'handle');
    end % for
    % 28 29
    ThisProp = schema.prop(hThisClass, 'inArgs', 'int32');
    hThisProp = schema.prop(hThisClass, 'outArgs', 'int32');
    % 31 32
    hThisProp = schema.prop(hThisClass, 'allImplement', 'handle vector');
    % 33 36
    % 34 36
    % 35 36
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 41 42
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 47 48
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 53 54
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 59 60
    m = schema.method(hThisClass, 'isLinked');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 65 66
    m = schema.method(hThisClass, 'isMasked');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 71 72
    m = schema.method(hThisClass, 'isLibrary');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
end % function
