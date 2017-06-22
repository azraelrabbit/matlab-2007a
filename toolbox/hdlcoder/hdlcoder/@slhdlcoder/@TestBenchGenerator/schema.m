function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('slhdlcoder');
    this = schema.class(pkg, 'TestBenchGenerator');
    % 9 10
    shpkg = findpackage('hdlshared');
    findclass(shpkg, 'SimulinkConnection');
    % 12 13
    schema.prop(this, 'ModelConnection', 'hdlshared.SimulinkConnection');
    % 14 16
    % 15 16
    schema.prop(this, 'TargetLanguage', 'HDLTargetLanguage');
    schema.prop(this, 'CodeGenDirectory', 'string');
    schema.prop(this, 'TimeStamp', 'string');
    % 19 20
    schema.prop(this, 'TestBenchName', 'string');
    schema.prop(this, 'TestBenchPostfix', 'string');
    % 22 23
    schema.prop(this, 'TBFileNameSuffix', 'string');
    % 24 25
    schema.prop(this, 'TestBenchStimulus', 'mxArray');
    schema.prop(this, 'TBUsertimulus', 'mxArray');
    schema.prop(this, 'TBRefSignals', 'bool');
    schema.prop(this, 'TBRefPostfix', 'string');
    % 29 30
    schema.prop(this, 'ClockName', 'string');
    schema.prop(this, 'ClockEnableName', 'string');
    schema.prop(this, 'ResetName', 'string');
    schema.prop(this, 'DataValidName', 'string');
    % 34 35
    schema.prop(this, 'ForceClockEnable', 'bool');
    schema.prop(this, 'ForceClockEnableValue', 'int');
    % 37 38
    schema.prop(this, 'ForceClock', 'bool');
    schema.prop(this, 'ForceClockHighTime', 'int');
    schema.prop(this, 'ForceClockLowTime', 'int');
    % 41 42
    schema.prop(this, 'ForceReset', 'bool');
    schema.prop(this, 'ForceResetValue', 'int');
    schema.prop(this, 'ForceHoldTime', 'int');
    % 45 46
    schema.prop(this, 'ErrorMargin', 'int');
    % 47 50
    % 48 50
    % 49 50
    schema.prop(this, 'InportNameList', 'string vector');
    schema.prop(this, 'OutportNameList', 'string vector');
    schema.prop(this, 'VectorPortNameMap', 'mxArray');
    schema.prop(this, 'InportNameMap', 'mxArray');
    % 54 56
    % 55 56
    p = schema.prop(this, 'InportSrc', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    % 58 59
    p = schema.prop(this, 'OutportSnk', 'mxArray');
    p.AccessFlags.AbortSet = 'off';
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    % 65 66
    schema.prop(this, 'VHDLTBPackageRequired', 'bool');
    % 67 68
    schema.prop(this, 'TestBenchFile', 'string');
    schema.prop(this, 'tbFileId', 'int');
    schema.prop(this, 'TestBenchPackageFile', 'string');
    schema.prop(this, 'tbPkgFileId', 'int');
    schema.prop(this, 'TestBenchDataFile', 'string');
    schema.prop(this, 'tbDataFileId', 'int');
end % function
