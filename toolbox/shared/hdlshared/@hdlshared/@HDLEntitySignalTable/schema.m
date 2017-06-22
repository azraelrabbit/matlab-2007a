function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('hdlshared');
    this = schema.class(package, 'HDLEntitySignalTable');
    findclass(package, 'HDLEntitySignal');
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    schema.prop(this, 'IsSequentialContext', 'bool');
    p.FactoryValue = 0.0;
    % 16 18
    % 17 18
    p = schema.prop(this, 'ClockList', 'mxArray');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    % 21 22
    p = schema.prop(this, 'ClockEnableList', 'mxArray');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    % 25 26
    p = schema.prop(this, 'ResetList', 'mxArray');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    % 29 30
    p = schema.prop(this, 'InportList', 'mxArray');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    % 33 34
    p = schema.prop(this, 'OutportList', 'mxArray');
    p.FactoryValue = [];
    p.AccessFlags.PublicSet = 'off';
    % 37 39
    % 38 39
    p = schema.prop(this, 'CurrentClock', 'double');
    p.FactoryValue = 0.0;
    % 41 42
    p = schema.prop(this, 'CurrentClockEnable', 'double');
    p.FactoryValue = 0.0;
    % 44 45
    p = schema.prop(this, 'CurrentReset', 'double');
    p.FactoryValue = 0.0;
    % 47 49
    % 48 49
    p = schema.prop(this, 'NextSignalIndex', 'int');
    p.FactoryValue = 1.0;
    % 51 54
    % 52 54
    % 53 54
    p = schema.prop(this, 'Signals', 'hdlshared.HDLEntitySignal vector');
    p.FactoryValue = [];
    % 56 63
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    p = schema.prop(this, 'Names', 'string vector');
    p.FactoryValue = {};
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    p = schema.prop(this, 'PortHandles', 'mxArray');
    p.FactoryValue = [];
end % function
