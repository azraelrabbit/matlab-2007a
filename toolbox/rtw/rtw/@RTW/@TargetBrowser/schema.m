function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('RTW');
    % 9 11
    % 10 11
    hDeriveFromPackage = findpackage('DAStudio');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'Object');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'TargetBrowser', hDeriveFromClass);
    % 16 18
    % 17 18
    hThisProp = schema.prop(hThisClass, 'tlcfiles', 'mxArray');
    hThisProp.FactoryValue = [];
    % 20 21
    hThisProp = schema.prop(hThisClass, 'tlclist', 'mxArray');
    hThisProp.FactoryValue = [];
    % 23 24
    hThisProp = schema.prop(hThisClass, 'selected', 'mxArray');
    hThisProp.FactoryValue = [];
    % 26 27
    hThisProp = schema.prop(hThisClass, 'ParentDlg', 'handle');
    hThisProp.FactoryValue = [];
    % 29 30
    hThisProp = schema.prop(hThisClass, 'ParentSrc', 'handle');
    hThisProp.FactoryValue = [];
    % 32 33
    hThisProp = schema.prop(hThisClass, 'ThisDlg', 'handle');
    hThisProp.FactoryValue = [];
    % 35 37
    % 36 37
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 42 43
    m = schema.method(hThisClass, 'uploadTarget');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
end % function
