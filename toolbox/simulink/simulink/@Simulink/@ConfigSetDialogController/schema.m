function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('Simulink');
    % 9 11
    % 10 11
    hThisClass = schema.class(hCreateInPackage, 'ConfigSetDialogController');
    % 12 14
    % 13 14
    hThisProp = schema.prop(hThisClass, 'ActiveTab', 'int');
    hThisProp.FactoryValue = 0.0;
    % 16 17
    hThisProp = schema.prop(hThisClass, 'DebugListboxValues', 'mxArray');
    hThisProp.FactoryValue = 0.0;
    % 19 20
    hThisProp = schema.prop(hThisClass, 'DebugActionValue', 'int');
    hThisProp.FactoryValue = 0.0;
    % 22 23
    hThisProp = schema.prop(hThisClass, 'TLCBrowser', 'handle');
    hThisProp.FactoryValue = [];
    % 25 26
    hThisProp = schema.prop(hThisClass, 'CustomCodeList', 'mxArray');
    hThisProp.FactoryValue = 0.0;
    % 28 29
    hThisProp = schema.prop(hThisClass, 'CustomIncludeList', 'mxArray');
    hThisProp.FactoryValue = 0.0;
    % 31 32
    hThisProp = schema.prop(hThisClass, 'SampleTimeInfoStr', 'string');
    hThisProp.FactoryValue = '';
    % 34 35
    hThisProp = schema.prop(hThisClass, 'SFSimTargetOptions', 'mxArray');
    hThisProp.FactoryValue = 0.0;
    % 37 38
    hThisProp = schema.prop(hThisClass, 'ErrorDialog', 'handle');
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Copy = 'off';
    hThisProp.Visible = 'off';
    hThisProp.FactoryValue = [];
    % 43 45
    % 44 45
    m = schema.method(hThisClass, 'ConfigSetDialogController');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle'};
    % 50 51
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 56 57
    m = schema.method(hThisClass, 'dialogCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
end % function
