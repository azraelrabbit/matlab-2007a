function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'SLDialogSource');
    hCreateInPackage = findpackage('Simulink');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'DDGSource', hDeriveFromClass);
    % 13 15
    % 14 15
    p = schema.prop(hThisClass, 'paramsMap', 'mxArray');
    p.FactoryValue = {};
    % 17 18
    p = schema.prop(hThisClass, 'ActiveTab', 'int');
    p.FactoryValue = 0.0;
    % 20 22
    % 21 22
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
end % function
