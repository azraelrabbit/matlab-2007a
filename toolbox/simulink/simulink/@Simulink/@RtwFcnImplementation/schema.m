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
    % 10 12
    % 11 12
    hCreateInPackage = findpackage('Simulink');
    % 13 15
    % 14 15
    hDeriveFromPackageDAS = findpackage('DAStudio');
    hDeriveFromClassDAS = findclass(hDeriveFromPackageDAS, 'Object');
    % 17 19
    % 18 19
    hThisClass = schema.class(hCreateInPackage, 'RtwFcnImplementation', hDeriveFromClassDAS);
    % 20 21
    if isempty(findtype('ImplementationType'))
        schema.EnumType('ImplementationType', {'FCN_IMPL_MACRO';'FCN_IMPL_FUNCT';'FCN_IMPL_CONST'});
    else
        % 24 26
        % 25 26
        % 26 27
        warning('A type named ''ImplementationType'' already exists.');
    end % if
    % 29 30
    hThisProp = schema.prop(hThisClass, 'ImplementName', 'string');
    % 31 32
    hThisProp = schema.prop(hThisClass, 'HeaderFile', 'string');
    % 33 34
    hThisProp = schema.prop(hThisClass, 'InDataType', 'string');
    hThisProp = schema.prop(hThisClass, 'NumInputs', 'int32');
    hThisProp = schema.prop(hThisClass, 'OutDataType', 'string');
    % 37 38
    hThisProp = schema.prop(hThisClass, 'Type', 'ImplementationType');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'FCN_IMPL_FUNCT';
    % 41 42
    hThisProp = schema.prop(hThisClass, 'genCallback', 'string');
    hThisProp.FactoryValue = '';
    % 44 45
    hThisProp = schema.prop(hThisClass, 'genFileName', 'string');
    hThisProp.FactoryValue = '';
    % 47 48
    hThisProp = schema.prop(hThisClass, 'UsageCount', 'int32');
    hThisProp.FactoryValue = 0.0;
    % 50 51
    hThisProp = schema.prop(hThisClass, 'acceptExprInput', 'bool');
    hThisProp.FactoryValue = true;
    % 53 54
    hThisProp = schema.prop(hThisClass, 'sideEffects', 'bool');
    hThisProp.FactoryValue = false;
    % 56 59
    % 57 59
    % 58 59
    m = schema.method(hThisClass, 'getDisplayLabel');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 64 65
    m = schema.method(hThisClass, 'getChildren');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle vector'};
    % 70 71
    m = schema.method(hThisClass, 'isHierarchical');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 76 77
    m = schema.method(hThisClass, 'isLinked');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 82 83
    m = schema.method(hThisClass, 'isMasked');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 88 89
    m = schema.method(hThisClass, 'isLibrary');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'bool'};
    % 94 95
    m = schema.method(hThisClass, 'getPreferredProperties');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string vector'};
    % 100 101
    m = schema.method(hThisClass, 'incUsage');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'int32'};
    % 106 107
    m = schema.method(hThisClass, 'resetUsage');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
end % function
