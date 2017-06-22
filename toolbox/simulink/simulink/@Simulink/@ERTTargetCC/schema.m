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
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomTargetCC');
    % 12 15
    % 13 15
    hThisClass = schema.class(hCreateInPackage, 'ERTTargetCC', hDeriveFromClass);
    % 15 18
    % 16 18
    hThisProp = schema.prop(hThisClass, 'GenerateErtSFunction', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 19 21
    hThisProp = schema.prop(hThisClass, 'GenerateASAP2', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 22 24
    hThisProp = schema.prop(hThisClass, 'ExtMode', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 25 27
    hThisProp = schema.prop(hThisClass, 'ExtModeTransport', 'slint');
    hThisProp.FactoryValue = 0.0;
    % 28 30
    hThisProp = schema.prop(hThisClass, 'ExtModeStaticAlloc', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 31 33
    hThisProp = schema.prop(hThisClass, 'ExtModeStaticAllocSize', 'slint');
    hThisProp.FactoryValue = 1e+06;
    % 34 36
    hThisProp = schema.prop(hThisClass, 'ExtModeTesting', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 37 39
    hThisProp = schema.prop(hThisClass, 'ExtModeMexFile', 'string');
    hThisProp.FactoryValue = 'ext_comm';
    % 40 42
    hThisProp = schema.prop(hThisClass, 'ExtModeMexArgs', 'string');
    hThisProp.FactoryValue = '';
    % 43 45
    hThisProp = schema.prop(hThisClass, 'ExtModeIntrfLevel', 'string');
    hThisProp.FactoryValue = 'Level1';
    % 46 48
    if isempty(findtype('CONFIG_TARGET_INLINEDPARAMETERPLACEMENT_ENUM'))
        schema.EnumType('CONFIG_TARGET_INLINEDPARAMETERPLACEMENT_ENUM', {'Hierarchical','NonHierarchical'}, [1.0 2.0]);
        % 49 51
    end
    hThisProp = schema.prop(hThisClass, 'InlinedParameterPlacement', 'CONFIG_TARGET_INLINEDPARAMETERPLACEMENT_ENUM');
    % 52 54
    hThisProp.FactoryValue = 'NonHierarchical';
    % 54 56
    if isempty(findtype('CONFIG_TARGET_ERT_TARGETOS_ENUM'))
        schema.EnumType('CONFIG_TARGET_ERT_TARGETOS_ENUM', {'BareBoardExample','VxWorksExample'}, [1.0 2.0]);
        % 57 59
    end
    hThisProp = schema.prop(hThisClass, 'TargetOS', 'CONFIG_TARGET_ERT_TARGETOS_ENUM');
    % 60 62
    hThisProp.FactoryValue = 'BareBoardExample';
    % 62 64
    if isempty(findtype('CONFIG_TARGET_MULTIINSTANCEERRORCODE_ENUM'))
        schema.EnumType('CONFIG_TARGET_MULTIINSTANCEERRORCODE_ENUM', {'None','Warning','Error'}, [1.0 2.0 3.0]);
        % 65 67
    end
    hThisProp = schema.prop(hThisClass, 'MultiInstanceErrorCode', 'CONFIG_TARGET_MULTIINSTANCEERRORCODE_ENUM');
    % 68 70
    hThisProp.FactoryValue = 'Error';
    % 70 72
    hThisProp = schema.prop(hThisClass, 'RateGroupingCode', 'slbool');
    hThisProp.FactoryValue = 'on';
    % 73 75
    if isempty(findtype('CONFIG_TARGET_ERT_ROOTLEVELIO_ENUM'))
        schema.EnumType('CONFIG_TARGET_ERT_ROOTLEVELIO_ENUM', {'Individual arguments','Structure reference'}, [0.0 1.0]);
        % 76 78
    end
    hThisProp = schema.prop(hThisClass, 'RootIOFormat', 'CONFIG_TARGET_ERT_ROOTLEVELIO_ENUM');
    % 79 81
    hThisPorp.FactoryValue = 'Individual Arguments';
    % 81 83
    hThisProp = schema.prop(hThisClass, 'RTWCAPISignals', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 84 86
    hThisProp = schema.prop(hThisClass, 'RTWCAPIParams', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 87 89
    hThisProp = schema.prop(hThisClass, 'RTWCAPIStates', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 90 92
    hThisProp = schema.prop(hThisClass, 'TargetID', 'MATLAB array');
    hThisProp.FactoryValue = [];
    hThisProp.Visible = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    % 95 97
    hThisProp = schema.prop(hThisClass, 'ERTSrcFileBannerTemplate', 'string');
    hThisProp.FactoryValue = 'ert_code_template.cgt';
    % 98 100
    hThisProp = schema.prop(hThisClass, 'ERTHdrFileBannerTemplate', 'string');
    hThisProp.FactoryValue = 'ert_code_template.cgt';
    % 101 103
    hThisProp = schema.prop(hThisClass, 'ERTDataSrcFileTemplate', 'string');
    hThisProp.FactoryValue = 'ert_code_template.cgt';
    % 104 106
    hThisProp = schema.prop(hThisClass, 'ERTDataHdrFileTemplate', 'string');
    hThisProp.FactoryValue = 'ert_code_template.cgt';
    % 107 109
    hThisProp = schema.prop(hThisClass, 'ERTCustomFileTemplate', 'string');
    hThisProp.FactoryValue = 'example_file_process.tlc';
    % 110 114
    % 111 114
    % 112 114
    if isempty(findtype('CONFIG_TARGET_INITIALVALUESOURCE_ENUM'))
        schema.EnumType('CONFIG_TARGET_INITIALVALUESOURCE_ENUM', {'Model','DataObject'}, [0.0 1.0]);
        % 115 117
    end
    hThisProp = schema.prop(hThisClass, 'InitialValueSource', 'CONFIG_TARGET_INITIALVALUESOURCE_ENUM');
    % 118 120
    hThisProp.FactoryValue = 'Model';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.SetFunction = @setFcn_InitialValueSource;
    % 122 124
    if isempty(findtype('CONFIG_TARGET_MODULENAMING_ENUM'))
        schema.EnumType('CONFIG_TARGET_MODULENAMING_ENUM', {'Unspecified','SameAsModel','UserSpecified'}, [0.0 1.0 2.0]);
        % 125 127
    end
    hThisProp = schema.prop(hThisClass, 'ModuleNamingRule', 'CONFIG_TARGET_MODULENAMING_ENUM');
    % 128 130
    hThisProp.FactoryValue = 'Unspecified';
    % 130 132
    hThisProp = schema.prop(hThisClass, 'ModuleName', 'string');
    hThisProp.FactoryValue = '';
    % 133 135
    hThisProp = schema.prop(hThisClass, 'SignalDisplayLevel', 'slint');
    hThisProp.FactoryValue = 10.0;
    % 136 138
    hThisProp = schema.prop(hThisClass, 'ParamTuneLevel', 'slint');
    hThisProp.FactoryValue = 10.0;
    % 139 141
    if isempty(findtype('CONFIG_TARGET_DATADEFINITION_ENUM'))
        schema.EnumType('CONFIG_TARGET_DATADEFINITION_ENUM', {'Auto','InSourceFile','InSeparateSourceFile'}, [0.0 1.0 2.0]);
        % 142 144
    end
    hThisProp = schema.prop(hThisClass, 'GlobalDataDefinition', 'CONFIG_TARGET_DATADEFINITION_ENUM');
    % 145 147
    hThisProp.FactoryValue = 'Auto';
    % 147 149
    hThisProp = schema.prop(hThisClass, 'DataDefinitionFile', 'string');
    hThisProp.FactoryValue = 'global.c';
    % 150 152
    if isempty(findtype('CONFIG_TARGET_DATAREFERENCE_ENUM'))
        schema.EnumType('CONFIG_TARGET_DATAREFERENCE_ENUM', {'Auto','InSourceFile','InSeparateHeaderFile'}, [0.0 1.0 2.0]);
        % 153 155
    end
    hThisProp = schema.prop(hThisClass, 'GlobalDataReference', 'CONFIG_TARGET_DATAREFERENCE_ENUM');
    % 156 158
    hThisProp.FactoryValue = 'Auto';
    % 158 160
    hThisProp = schema.prop(hThisClass, 'DataReferenceFile', 'string');
    hThisProp.FactoryValue = 'global.h';
    % 161 163
    hThisProp = schema.prop(hThisClass, 'GRTInterface', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 164 166
    hThisProp = schema.prop(hThisClass, 'PreserveExpressionOrder', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 167 169
    hThisProp = schema.prop(hThisClass, 'PreserveIfCondition', 'slbool');
    hThisProp.FactoryValue = 'off';
    % 170 172
    if feature('RTWReplacementTypes')
        hThisProp = schema.prop(hThisClass, 'EnableUserReplacementTypes', 'slbool');
        hThisProp.FactoryValue = 'off';
        % 174 176
        hThisProp = schema.prop(hThisClass, 'ReplacementTypes', 'MATLAB array');
        defaultRT.double = '';
        defaultRT.single = '';
        defaultRT.int32 = '';
        defaultRT.int16 = '';
        defaultRT.int8 = '';
        defaultRT.uint32 = '';
        defaultRT.uint16 = '';
        defaultRT.uint8 = '';
        defaultRT.boolean = '';
        defaultRT.int = '';
        defaultRT.uint = '';
        defaultRT.char = '';
        hThisProp.FactoryValue = defaultRT;
    end
    % 190 193
    % 191 193
    hThisProp = schema.prop(hThisClass, 'MemSecPackage', 'string');
    hThisProp.FactoryValue = '--- None ---';
    % 194 197
    % 195 197
    msDataCategories = {'MemSecDataConstants','MemSecDataIO','MemSecDataInternal','MemSecDataParameters'};
    % 197 203
    % 198 203
    % 199 203
    % 200 203
    % 201 203
    msDataPrompts = {'Constants:','Inputs/Outputs:','Internal data:','Parameters:'};
    % 203 209
    % 204 209
    % 205 209
    % 206 209
    % 207 209
    msFunctionCategories = {'MemSecFuncInitTerm','MemSecFuncExecute'};
    % 209 213
    % 210 213
    % 211 213
    msFunctionPrompts = {'Initialize/Terminate:','Execution:'};
    % 213 218
    % 214 218
    % 215 218
    % 216 218
    for idx=1.0:length(msDataCategories)
        hThisProp = schema.prop(hThisClass, msDataCategories{idx}, 'string');
        hThisProp.FactoryValue = 'Default';
    end % for
    % 221 223
    for idx=1.0:length(msFunctionCategories)
        hThisProp = schema.prop(hThisClass, msFunctionCategories{idx}, 'string');
        hThisProp.FactoryValue = 'Default';
    end % for
    % 226 229
    % 227 229
    hPreSetListener = handle.listener(hThisClass, hThisClass.Properties, 'PropertyPreSet', @preSetFcn_Prop);
    % 229 233
    % 230 233
    % 231 233
    schema.prop(hThisProp, 'PreSetListener', 'handle');
    hThisProp.PreSetListener = hPreSetListener;
    % 234 239
    % 235 239
    % 236 239
    % 237 239
    hThisProp = schema.prop(hThisClass, 'MemSecDataCategories', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.FactoryValue = msDataCategories;
    % 243 245
    hThisProp = schema.prop(hThisClass, 'MemSecDataPrompts', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.FactoryValue = msDataPrompts;
    % 249 251
    hThisProp = schema.prop(hThisClass, 'MemSecFuncCategories', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.FactoryValue = msFunctionCategories;
    % 255 257
    hThisProp = schema.prop(hThisClass, 'MemSecFuncPrompts', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'off';
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.FactoryValue = msFunctionPrompts;
    % 261 265
    % 262 265
    % 263 265
    hThisProp = schema.prop(hThisClass, 'ErrorDialog', 'handle');
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Copy = 'off';
    hThisProp.Visible = 'off';
    hThisProp.FactoryValue = [];
    % 269 272
    % 270 272
    m = schema.method(hThisClass, 'update');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 276 278
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 282 284
    m = schema.method(hThisClass, 'getStringFormat');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'mxArray'};
    % 288 290
    m = schema.method(hThisClass, 'dialogCallback');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','string','string'};
    s.OutputTypes = {};
    % 294 296
    m = schema.method(hThisClass, 'getMemSecPackageList');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','bool'};
    s.OutputTypes = {'mxArray'};
    % 300 302
    m = schema.method(hThisClass, 'getMdlRefComplianceTable');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','Sl_MdlRefTarget_EnumType'};
    s.OutputTypes = {'MATLAB array'};
end
function preSetFcn_Prop(hProp, eventData)
    % 308 313
    % 309 313
    % 310 313
    % 311 313
    hObj = eventData.AffectedObject;
    if not(isequal(get(hObj, hProp.Name), eventData.NewVal))
        hObj.dirtyHostBD;
    end
end
function actVal = setFcn_InitialValueSource(hObj, newVal)
    % 318 320
    actVal = newVal;
    % 320 322
    persistent PERSISTENT_WARN_STATE;
    if isempty(PERSISTENT_WARN_STATE)
        s = warning;
        warning('off', 'backtrace')
        warning(sprintf('The InitialValueSource property of ConfigSet is obsolete.  Signal object InitialValue property now disregards this option.'));
        % 326 329
        % 327 329
        warning(s);
        % 329 333
        % 330 333
        % 331 333
        PERSISTENT_WARN_STATE = 1.0;
    end
end
