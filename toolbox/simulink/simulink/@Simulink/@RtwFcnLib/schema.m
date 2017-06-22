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
    hThisClass = schema.class(hCreateInPackage, 'RtwFcnLib', hDeriveFromClassDAS);
    % 19 21
    % 20 21
    hThisProp = schema.prop(hThisClass, 'matFileName', 'string');
    % 22 25
    % 23 25
    % 24 25
    hThisProp = schema.prop(hThisClass, 'MCallList', 'handle vector');
    hThisProp = schema.prop(hThisClass, 'TLCCallList', 'handle vector');
    % 27 29
    % 28 29
    hThisProp = schema.prop(hThisClass, 'inlineString', 'string');
    hThisProp.FactoryValue = '';
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    fcnProps = rtwmath_base_fcn_name_list;
    % 37 38
    for fcn=fcnProps
        hThisProp = schema.prop(hThisClass, fcn{1.0}, 'handle');
    end % for
    % 41 42
    hThisProp = schema.prop(hThisClass, 'allFcns', 'handle vector');
    % 43 45
    % 44 45
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 50 51
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 56 57
    m = schema.method(hThisClass, 'getHierarchicalChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 62 63
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 68 69
    m = schema.method(hThisClass, 'isLinked');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 74 75
    m = schema.method(hThisClass, 'isMasked');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 80 81
    m = schema.method(hThisClass, 'isLibrary');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 86 87
    m = schema.method(hThisClass, 'resetFcnImplementationCounts');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
end % function
