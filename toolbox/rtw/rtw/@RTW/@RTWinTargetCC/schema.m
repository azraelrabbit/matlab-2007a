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
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomTargetCC');
    % 13 15
    % 14 15
    hThisClass = schema.class(hCreateInPackage, 'RTWinTargetCC', hDeriveFromClass);
    % 16 19
    % 17 19
    % 18 19
    hThisProp = schema.prop(hThisClass, 'CCOptimize', 'on/off');
    hThisProp.FactoryValue = 'on';
    % 21 22
    hThisProp = schema.prop(hThisClass, 'CCListing', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 24 25
    hThisProp = schema.prop(hThisClass, 'RebuildAll', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 27 28
    hThisProp = schema.prop(hThisClass, 'ExtMode', 'on/off');
    hThisProp.FactoryValue = 'on';
    % 30 31
    hThisProp = schema.prop(hThisClass, 'ExtModeTransport', 'slint');
    hThisProp.FactoryValue = 0.0;
    % 33 34
    hThisProp = schema.prop(hThisClass, 'ExtModeStaticAlloc', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 36 37
    hThisProp = schema.prop(hThisClass, 'ExtModeStaticAllocSize', 'slint');
    hThisProp.FactoryValue = 1e+06;
    % 39 40
    hThisProp = schema.prop(hThisClass, 'ExtModeTesting', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 42 43
    hThisProp = schema.prop(hThisClass, 'ExtModeMexFile', 'string');
    hThisProp.FactoryValue = 'rtwinext';
    % 45 46
    hThisProp = schema.prop(hThisClass, 'ExtModeMexArgs', 'string');
    hThisProp.FactoryValue = '';
    % 48 49
    hThisProp = schema.prop(hThisClass, 'ExtModeIntrfLevel', 'string');
    hThisProp.FactoryValue = 'Level1';
    % 51 52
    hPreSetListener = handle.listener(hThisClass, hThisClass.Properties, 'PropertyPreSet', @preSetFcn_Prop);
    % 53 54
    schema.prop(hThisProp, 'PreSetListener', 'handle');
    hThisProp.PreSetListener = hPreSetListener;
    % 56 58
    % 57 58
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 63 64
    m = schema.method(hThisClass, 'getStringFormat');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 69 70
    m = schema.method(hThisClass, 'dialogCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
    % 75 76
    m = schema.method(hThisClass, 'update');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
end % function
function preSetFcn_Prop(hProp, eventData)
    % 83 87
    % 84 87
    % 85 87
    % 86 87
    hObj = eventData.AffectedObject;
    if not(isequal(get(hObj, hProp.Name), eventData.NewVal))
        hObj.dirtyHostBD;
    end % if
end % function
