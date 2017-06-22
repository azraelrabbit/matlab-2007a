function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('slmgr');
    thisclass = schema.class(pk, 'SLConnectMgr');
    % 11 14
    % 12 14
    % 13 14
    findclass(pk, 'SignalSelectMgr');
    p = schema.prop(thisclass, 'hSignalSelectMgr', 'slmgr.SignalSelectMgr');
    p.AccessFlags.PublicSet = 'off';
    % 17 18
    findclass(pk, 'SimState');
    p = schema.prop(thisclass, 'hSimState', 'slmgr.SimState');
    p.AccessFlags.PublicSet = 'off';
    % 21 22
    findclass(pk, 'SignalData');
    p = schema.prop(thisclass, 'hSignalData', 'slmgr.SignalData');
    p.AccessFlags.PublicSet = 'off';
    % 25 26
    findclass(pk, 'SLEventSink');
    schema.prop(thisclass, 'hEventSink', 'slmgr.SLEventSink');
    % 28 29
    findclass(pk, 'SLDataSink');
    schema.prop(thisclass, 'hDataSink', 'slmgr.SLDataSink');
    % 31 32
    p = schema.prop(thisclass, 'connected', 'bool');
    p.FactoryValue = 0.0;
    % 34 35
    p = schema.prop(thisclass, 'errMsg', 'MATLAB array');
    p.FactoryValue = '';
    % 37 39
    % 38 39
    p = schema.prop(thisclass, 'Listeners', 'handle.listener vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
