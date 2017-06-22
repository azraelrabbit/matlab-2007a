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
    hThisClass = schema.class(hCreateInPackage, 'DDGSource_NDIndexing', hDeriveFromClass);
    % 13 15
    % 14 15
    p = schema.prop(hThisClass, 'DialogData', 'mxArray');
    p.FactoryValue = {};
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 25 26
    m = schema.method(hThisClass, 'isDialogOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'bool'};
    % 30 31
    m = schema.method(hThisClass, 'isPortOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'bool'};
    % 35 37
    % 36 37
    m = schema.method(hThisClass, 'NumDimsCallback');
    s = m.Signature;
    s.InputTypes = {'handle','handle','mxArray'};
    s.OutputTypes = {};
    % 41 42
    m = schema.method(hThisClass, 'ParamWidgetCallback');
    s = m.Signature;
    s.InputTypes = {'handle','handle','string','bool','mxArray'};
    s.OutputTypes = {};
    % 46 47
    m = schema.method(hThisClass, 'PreApplyCallback');
    s = m.Signature;
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool','string'};
    % 51 52
    m = schema.method(hThisClass, 'CloseCallback');
    s = m.Signature;
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {};
    % 56 57
    m = schema.method(hThisClass, 'getNumDims');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {'int'};
    % 61 62
    m = schema.method(hThisClass, 'getCommonWidgets');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray','mxArray','mxArray','mxArray'};
    % 66 67
    m = schema.method(hThisClass, 'getDimsPropTableColHeader');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 71 72
    m = schema.method(hThisClass, 'getColId');
    s = m.Signature;
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'int'};
    % 76 77
    m = schema.method(hThisClass, 'getColWidth');
    s = m.Signature;
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'int'};
    % 81 82
    m = schema.method(hThisClass, 'getDimsPropTableData');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 86 87
    m = schema.method(hThisClass, 'getEnumValFromStr');
    s = m.Signature;
    s.InputTypes = {'handle','string','mxArray'};
    s.OutputTypes = {'int'};
    % 91 92
    m = schema.method(hThisClass, 'isAllOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'bool'};
    % 96 97
    m = schema.method(hThisClass, 'getIndexStrForPortOpt');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'string'};
    % 101 102
    m = schema.method(hThisClass, 'getIndexPortName');
    s = m.Signature;
    s.InputTypes = {'handle','int'};
    s.OutputTypes = {'string'};
    % 106 107
    m = schema.method(hThisClass, 'getIndexStrForAllOpt');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 111 112
    m = schema.method(hThisClass, 'constructDlgStruct');
    s = m.Signature;
    s.InputTypes = {'handle','mxArray','int'};
    s.OutputTypes = {'mxArray'};
    % 116 117
    m = schema.method(hThisClass, 'getDefIdxOpt');
    s = m.Signature;
    s.InputTypes = {'handle'};
    s.OutputTypes = {'string'};
    % 121 122
    m = schema.method(hThisClass, 'initWidget');
    s = m.Signature;
    s.InputTypes = {'handle','string','bool'};
    s.OutputTypes = {'mxArray'};
end % function
