function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hCreateInPackage = findpackage('Simulink');
    % 8 11
    % 9 11
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomCC');
    % 12 15
    % 13 15
    hThisClass = schema.class(hCreateInPackage, 'SFTargetCC', hDeriveFromClass);
    % 15 18
    % 16 18
    hThisProp = schema.prop(hThisClass, 'ApplyToAllLibs', 'bool');
    hThisProp.FactoryValue = logical(1);
    % 19 21
    hThisProp = schema.prop(hThisClass, 'Document', 'string');
    hThisProp.FactoryValue = '';
    % 22 24
    hThisProp = schema.prop(hThisClass, 'Tag', 'string');
    hThisProp.FactoryValue = '';
    % 25 27
    hThisProp = schema.prop(hThisClass, 'CustomCode', 'string');
    hThisProp.FactoryValue = '';
    % 28 30
    hThisProp = schema.prop(hThisClass, 'CustomInitializer', 'string');
    hThisProp.FactoryValue = '';
    % 31 33
    hThisProp = schema.prop(hThisClass, 'CustomTerminator', 'string');
    hThisProp.FactoryValue = '';
    % 34 36
    hThisProp = schema.prop(hThisClass, 'UserIncludeDirs', 'string');
    hThisProp.FactoryValue = '';
    % 37 39
    hThisProp = schema.prop(hThisClass, 'UserSources', 'string');
    hThisProp.FactoryValue = '';
    % 40 42
    hThisProp = schema.prop(hThisClass, 'UserLibraries', 'string');
    hThisProp.FactoryValue = '';
    % 43 45
    hThisProp = schema.prop(hThisClass, 'CodegenDirectory', 'string');
    hThisProp.FactoryValue = '';
    % 46 48
    hThisProp = schema.prop(hThisClass, 'CodeFlagsInfo', 'mxArray');
    hThisProp.FactoryValue = [];
    % 49 51
    hThisProp = schema.prop(hThisClass, 'Id', 'int32');
    hThisProp.FactoryValue = 0.0;
    % 52 54
    hThisProp = schema.prop(hThisClass, 'SelectedCmd', 'int32');
    hThisProp.FactoryValue = 0.0;
    % 55 57
    hThisProp = schema.prop(hThisClass, 'TargetOptionsDlg', 'handle');
    hThisProp.FactoryValue = [];
    hThisProp.AccessFlags.Serialize = 'off';
    % 59 61
    hThisProp = schema.prop(hThisClass, 'CoderOptionsDlg', 'handle');
    hThisProp.FactoryValue = [];
    hThisProp.AccessFlags.Serialize = 'off';
    % 63 66
    % 64 66
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 70 72
    m = schema.method(hThisClass, 'createChildDlg');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
end
