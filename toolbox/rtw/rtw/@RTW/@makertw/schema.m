function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hCreateInPackage = findpackage('RTW');
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'makertw');
    % 13 16
    % 14 16
    % 15 16
    hThisProp = schema.prop(hThisClass, 'ModelName', 'string');
    % 17 18
    hThisProp = schema.prop(hThisClass, 'ModelHandle', 'double');
    hThisProp = schema.prop(hThisClass, 'InitRTWOptsAndGenSettingsOnly', 'double');
    hThisProp = schema.prop(hThisClass, 'BuildArgs', 'string');
    hThisProp = schema.prop(hThisClass, 'DispHook', 'MATLAB array');
    hThisProp = schema.prop(hThisClass, 'MdlRefBuildArgs', 'MATLAB array');
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    hThisProp = schema.prop(hThisClass, 'OrigRecycleState', 'string');
    % 30 32
    % 31 32
    hThisProp = schema.prop(hThisClass, 'CodeReuse', 'double');
    % 33 35
    % 34 35
    hThisProp = schema.prop(hThisClass, 'SystemTargetFilename', 'string');
    hThisProp = schema.prop(hThisClass, 'MakeRTWHookMFile', 'string');
    % 37 39
    % 38 39
    hThisProp = schema.prop(hThisClass, 'BuildDirectory', 'string');
    hThisProp = schema.prop(hThisClass, 'StartDirToRestore', 'string');
    hThisProp = schema.prop(hThisClass, 'GeneratedTLCSubDir', 'string');
    % 42 43
    hThisProp = schema.prop(hThisClass, 'TemplateMakefile', 'string');
    hThisProp = schema.prop(hThisClass, 'CompilerEnvVal', 'string');
    % 45 46
    hThisProp = schema.prop(hThisClass, 'RTWRoot', 'string');
    % 47 49
    % 48 49
    hThisProp = schema.prop(hThisClass, 'BuildOpts', 'MATLAB array');
    % 50 53
    % 51 53
    % 52 53
    hThisProp = schema.prop(hThisClass, 'AnsiDataTypeTable', 'MATLAB array');
    % 54 57
    % 55 57
    % 56 57
    hThisProp = schema.prop(hThisClass, 'mexOpts', 'MATLAB array');
    % 58 60
    % 59 60
    hThisProp = schema.prop(hThisClass, 'LogFileName', 'string');
    % 61 64
    % 62 64
    % 63 64
    hThisProp = schema.prop(hThisClass, 'BuildInfo', 'handle');
    hThisProp.FactoryValue = [];
    % 66 69
    % 67 69
    % 68 69
    hThisProp = schema.prop(hThisClass, 'ChangeRec', 'MATLAB array');
    hThisProp.FactoryValue = [];
    % 71 74
    % 72 74
    % 73 74
    hThisProp = schema.prop(hThisClass, 'PathToRestore', 'string');
    hThisProp.FactoryValue = '';
    % 76 78
    % 77 78
    hThisProp = schema.prop(hThisClass, 'CompilerName', 'string');
    hThisProp.FactoryValue = '';
    % 80 82
    % 81 82
    hThisProp = schema.prop(hThisClass, 'PreferredTMF', 'string');
    hThisProp.FactoryValue = '';
    % 84 86
    % 85 86
    hThisProp = schema.prop(hThisClass, 'InstallDirmexopts', 'string');
    hThisProp.FactoryValue = '';
end % function
