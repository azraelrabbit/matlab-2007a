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
    hThisClass = schema.class(hCreateInPackage, 'RSimTargetCC', hDeriveFromClass);
    % 16 19
    % 17 19
    % 18 19
    if isempty(findtype('CONFIG_TARGET_RSIM_SOLVERSELECTION_ENUM'))
        schema.EnumType('CONFIG_TARGET_RSIM_SOLVERSELECTION_ENUM', {'Auto','UseSolverModule','UseFixStep'}, [1.0 2.0 3.0]);
        % 21 22
    end % if
    hThisProp = schema.prop(hThisClass, 'RSIM_SOLVER_SELECTION', 'CONFIG_TARGET_RSIM_SOLVERSELECTION_ENUM');
    % 24 25
    hThisProp.FactoryValue = 'Auto';
    % 26 27
    hThisProp = schema.prop(hThisClass, 'PCMatlabRoot', 'string');
    hThisProp.FactoryValue = strrep(matlabroot, '\', '\\');
    hThisProp.AccessFlags.Serialize = 'off';
    % 30 31
    hThisProp = schema.prop(hThisClass, 'ExtMode', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 33 34
    hThisProp = schema.prop(hThisClass, 'ExtModeTransport', 'slint');
    hThisProp.FactoryValue = 0.0;
    % 36 37
    hThisProp = schema.prop(hThisClass, 'ExtModeStaticAlloc', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 39 40
    hThisProp = schema.prop(hThisClass, 'ExtModeStaticAllocSize', 'slint');
    hThisProp.FactoryValue = 1e+06;
    % 42 43
    hThisProp = schema.prop(hThisClass, 'ExtModeTesting', 'on/off');
    hThisProp.FactoryValue = 'off';
    % 45 46
    hThisProp = schema.prop(hThisClass, 'ExtModeMexFile', 'string');
    hThisProp.FactoryValue = 'ext_comm';
    % 48 49
    hThisProp = schema.prop(hThisClass, 'ExtModeMexArgs', 'string');
    hThisProp.FactoryValue = '';
    % 51 52
    hThisProp = schema.prop(hThisClass, 'ExtModeIntrfLevel', 'string');
    hThisProp.FactoryValue = 'Level1';
    % 54 55
    hThisProp = schema.prop(hThisClass, 'RSIM_PARAMETER_LOADING', 'on/off');
    hThisProp.FactoryValue = 'on';
    % 57 58
    hThisProp = schema.prop(hThisClass, 'RSIM_STORAGE_CLASS_AUTO', 'on/off');
    hThisProp.FactoryValue = 'on';
    % 60 61
    hThisProp = schema.prop(hThisClass, 'RTWCAPISignals', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 63 64
    hThisProp = schema.prop(hThisClass, 'RTWCAPIParams', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 66 67
    hThisProp = schema.prop(hThisClass, 'RTWCAPIStates', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 69 70
    hPreSetListener = handle.listener(hThisClass, hThisClass.Properties, 'PropertyPreSet', @preSetFcn_Prop);
    % 71 72
    schema.prop(hThisProp, 'PreSetListener', 'handle');
    hThisProp.PreSetListener = hPreSetListener;
    % 74 76
    % 75 76
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 81 82
    m = schema.method(hThisClass, 'getStringFormat');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 87 88
    m = schema.method(hThisClass, 'dialogCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
    % 93 94
    m = schema.method(hThisClass, 'update');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 99 100
    m = schema.method(hThisClass, 'getMdlRefComplianceTable');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','Sl_MdlRefTarget_EnumType'};
    s.OutputTypes = {'MATLAB array'};
end % function
function preSetFcn_Prop(hProp, eventData)
    % 107 111
    % 108 111
    % 109 111
    % 110 111
    hObj = eventData.AffectedObject;
    if not(isequal(get(hObj, hProp.Name), eventData.NewVal))
        hObj.dirtyHostBD;
    end % if
end % function
