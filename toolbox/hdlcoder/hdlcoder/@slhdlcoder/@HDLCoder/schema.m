function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mlock;
    % 9 10
    pkg = findpackage('slhdlcoder');
    this = schema.class(pkg, 'HDLCoder');
    findclass(pkg, 'HDLImplDatabase');
    findclass(pkg, 'ConfigurationManager');
    % 14 15
    shpkg = findpackage('hdlshared');
    findclass(shpkg, 'SimulinkConnection');
    findclass(shpkg, 'SimulinkFrontEnd');
    findclass(shpkg, 'SimulinkBackEnd');
    % 19 20
    propspkg = findpackage('hdlcoderprops');
    findclass(propspkg, 'HDLProps');
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    p = schema.prop(this, 'privStartNodeName', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 30 31
    p = schema.prop(this, 'StartNodeName', 'string');
    p.setFunction = @setStartNodeName;
    % 33 36
    % 34 36
    % 35 36
    p.getFunction = @getStartNodeName;
    % 37 39
    % 38 39
    schema.prop(this, 'ModelConnection', 'hdlshared.SimulinkConnection');
    % 40 41
    schema.prop(this, 'FrontEnd', 'hdlshared.SimulinkFrontEnd');
    % 42 43
    schema.prop(this, 'BackEnd', 'hdlshared.SimulinkBackEnd');
    % 44 45
    p = schema.prop(this, 'CoderParameters', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'GetFunction', @get_coderparameters);
    % 47 48
    schema.prop(this, 'CoderParameterObject', 'hdlcoderprops.HDLProps');
    schema.prop(this, 'TimeStamp', 'string');
    schema.prop(this, 'CodeGenSuccessful', 'bool');
    schema.prop(this, 'LastStartNodeName', 'string');
    schema.prop(this, 'LastTargetLanguage', 'string');
    % 53 55
    % 54 55
    schema.prop(this, 'VHDLTBPackageRequired', 'bool');
    % 56 57
    schema.prop(this, 'ImplDB', 'slhdlcoder.HDLImplDatabase');
    schema.prop(this, 'ConfigManager', 'slhdlcoder.ConfigurationManager');
    % 59 62
    % 60 62
    % 61 62
    schema.prop(this, 'SequentialContext', 'bool');
    % 63 64
    schema.prop(this, 'EntityPathList', 'string vector');
    schema.prop(this, 'EntityNameList', 'string vector');
    schema.prop(this, 'EntityPortList', 'string vector');
    schema.prop(this, 'EntityArchList', 'mxArray');
    % 68 69
    pir_udd;
    schema.prop(this, 'PirInstance', 'hdlcoder.pir');
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    % 75 76
    schema.prop(this, 'CurrentNetwork', 'hdlcoder.network');
    % 77 79
    % 78 79
    schema.prop(this, 'CommandLineArgs', 'mxArray');
    % 80 83
    % 81 83
    % 82 83
    schema.prop(this, 'TimingControllerInfo', 'mxArray');
    % 84 86
    % 85 86
    p = schema.prop(this, 'isvhdl', 'bool');
    p.FactoryValue = true;
    % 88 90
    % 89 90
    p = schema.prop(this, 'CurrentClock', 'hdlcoder.signal');
    p.FactoryValue = [];
    % 92 93
    p = schema.prop(this, 'CurrentClockEnable', 'hdlcoder.signal');
    p.FactoryValue = [];
    % 95 96
    p = schema.prop(this, 'CurrentReset', 'hdlcoder.signal');
    p.FactoryValue = [];
    % 98 100
    % 99 100
    p = schema.prop(this, 'HasClockEnable', 'bool');
    p.FactoryValue = true;
    % 102 104
    % 103 104
    p = schema.prop(this, 'ClockList', 'hdlcoder.signal vector');
    p.FactoryValue = [];
    % 106 107
    p = schema.prop(this, 'ClockEnableList', 'hdlcoder.signal vector');
    p.FactoryValue = [];
    % 109 110
    p = schema.prop(this, 'ResetList', 'hdlcoder.signal vector');
    p.FactoryValue = [];
end % function
function cp = get_coderparameters(this, cp)
    % 114 118
    % 115 118
    % 116 118
    % 117 118
    cp = struct(this.CoderParameterObject.INI);
end % function
function nodeName = setStartNodeName(this, nodeName)
    % 121 125
    % 122 125
    % 123 125
    % 124 125
    this.updateStartNodeName(nodeName);
    % 126 128
    % 127 128
    nodeName = '';
end % function
