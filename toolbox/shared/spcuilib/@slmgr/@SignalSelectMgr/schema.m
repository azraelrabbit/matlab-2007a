function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('slmgr');
    c = schema.class(pk, 'SignalSelectMgr');
    % 10 11
    definetypes;
    % 12 13
    schema.prop(c, 'Constraints', 'slmgr.SignalConstraints');
    % 14 15
    p = schema.prop(c, 'Signals', 'slmgr.SignalSelect vector');
    set(p, 'SetFunction', @set_signals, 'GetFunction', @get_signals, 'AccessFlags.Init', 'Off')
    % 17 19
    % 18 19
    schema.event(c, 'SignalAdded');
    schema.event(c, 'SignalRemoved');
    % 21 23
    % 22 23
    p = schema.prop(c, 'FlashTimer', 'mxArray');
    set(p, 'Visible', 'Off');
end % function
function signals = set_signals(this, signals)
    % 27 29
    % 28 29
    this.init(signals);
    % 30 32
    % 31 32
    signals = [];
end % function
function signals = get_signals(this, signals)
    % 35 37
    % 36 37
    signals = find(this, '-isa', 'slmgr.SignalSelect');
end % function
function definetypes
    % 40 42
    % 41 42
    findclass(findpackage('slmgr'), 'SignalConstraints');
    findclass(findpackage('slmgr'), 'SignalSelect');
end % function
