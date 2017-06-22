function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'DDGSource_NDIndexing');
    hCreateInPackage = findpackage('Simulink');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'DDGSource_Selector', hDeriveFromClass);
    % 13 15
    % 14 15
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 20
    m = schema.method(hThisClass, 'isDialogOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'bool'};
    % 24 25
    m = schema.method(hThisClass, 'isPortOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'bool'};
    % 29 31
    % 30 31
    m = schema.method(hThisClass, 'isIdxVectOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'bool'};
    % 35 36
    m = schema.method(hThisClass, 'isStartEndOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'bool'};
    % 40 41
    m = schema.method(hThisClass, 'getOutSizeStrForAllOpt');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 45 46
    m = schema.method(hThisClass, 'getOutSizeStrForDlgIdxOpt');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 50 51
    m = schema.method(hThisClass, 'getOutSizeStrForPrtIdxOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'string'};
    % 55 56
    m = schema.method(hThisClass, 'getOutSizeStrForPrtStartEndOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'string'};
end % function
