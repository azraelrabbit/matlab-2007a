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
    hThisClass = schema.class(hCreateInPackage, 'TornadoTargetCC', hDeriveFromClass);
    % 16 19
    % 17 19
    % 18 19
    hThisProp = schema.prop(hThisClass, 'MatFileLogging', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 21 22
    if isempty(findtype('CONFIG_TARGET_TORNADO_LOGVARMODIFIER_ENUM'))
        schema.EnumType('CONFIG_TARGET_TORNADO_LOGVARMODIFIER_ENUM', {'rt_','_rt','none'}, [0.0 1.0 2.0]);
        % 24 25
    end % if
    hThisProp = schema.prop(hThisClass, 'LogVarNameModifier', 'CONFIG_TARGET_TORNADO_LOGVARMODIFIER_ENUM');
    % 27 28
    hThisProp.FactoryValue = 'rt_';
    % 29 30
    if isempty(findtype('CONFIG_TARGET_TORNADO_CODEFORMAT_ENUM'))
        schema.EnumType('CONFIG_TARGET_TORNADO_CODEFORMAT_ENUM', {'RealTime','RealTimeMalloc'}, [0.0 1.0]);
        % 32 33
    end % if
    hThisProp = schema.prop(hThisClass, 'CodeFormat', 'CONFIG_TARGET_TORNADO_CODEFORMAT_ENUM');
    % 35 36
    hThisProp.FactoryValue = 'RealTime';
    % 37 38
    hThisProp = schema.prop(hThisClass, 'StethoScope', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 40 41
    hThisProp = schema.prop(hThisClass, 'DownloadToVxWorks', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 43 44
    hThisProp = schema.prop(hThisClass, 'BasePriority', 'slint');
    hThisProp.FactoryValue = 30.0;
    % 46 47
    hThisProp = schema.prop(hThisClass, 'TaskStackSize', 'slint');
    hThisProp.FactoryValue = 16384.0;
    % 49 50
    hThisProp = schema.prop(hThisClass, 'ExtMode', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 52 53
    hThisProp = schema.prop(hThisClass, 'ExtModeTransport', 'slint');
    hThisProp.FactoryValue = 0.0;
    % 55 56
    hThisProp = schema.prop(hThisClass, 'ExtModeStaticAlloc', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 58 59
    hThisProp = schema.prop(hThisClass, 'ExtModeStaticAllocSize', 'slint');
    hThisProp.FactoryValue = 1e+06;
    % 61 62
    hThisProp = schema.prop(hThisClass, 'ExtModeTesting', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 64 65
    hThisProp = schema.prop(hThisClass, 'ExtModeMexFile', 'string');
    hThisProp.FactoryValue = 'ext_comm';
    % 67 68
    hThisProp = schema.prop(hThisClass, 'ExtModeMexArgs', 'string');
    hThisProp.FactoryValue = '';
    % 70 71
    hThisProp = schema.prop(hThisClass, 'ExtModeIntrfLevel', 'string');
    hThisProp.FactoryValue = 'Level1';
    % 73 74
    hThisProp = schema.prop(hThisClass, 'RTWCAPIParams', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 76 77
    hThisProp = schema.prop(hThisClass, 'RTWCAPISignals', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 79 81
    % 80 81
    hPreSetListener = handle.listener(hThisClass, hThisClass.Properties, 'PropertyPreSet', @preSetFcn_Prop);
    % 82 83
    schema.prop(hThisProp, 'PreSetListener', 'handle');
    hThisProp.PreSetListener = hPreSetListener;
    % 85 87
    % 86 87
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 92 93
    m = schema.method(hThisClass, 'getStringFormat');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 98 99
    m = schema.method(hThisClass, 'dialogCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
    % 104 105
    m = schema.method(hThisClass, 'update');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
end % function
function preSetFcn_Prop(hProp, eventData)
    % 112 116
    % 113 116
    % 114 116
    % 115 116
    hObj = eventData.AffectedObject;
    if not(isequal(get(hObj, hProp.Name), eventData.NewVal))
        hObj.dirtyHostBD;
    end % if
    % 120 121
    if strcmp(hProp.Name, 'ExtMode')
        if strcmp(eventData.NewVal, 'on')
            set(hObj, 'StethoScope', 'off');
        end % if
    end % if
end % function
