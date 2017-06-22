function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage = findpackage('MPlay');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'DialogBase');
    hCreateInPackage = findpackage('MPlay');
    hThisClass = schema.class(hCreateInPackage, 'FrameRate', hDeriveFromClass);
    % 12 13
    MPlay.RegisterDDGMethods(hThisClass, {'getDialogSchema','validate'});
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    m = schema.method(hThisClass, 'handleButtons');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(hThisClass, 'source_fps', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 30 32
    % 31 32
    schema.prop(hThisClass, 'desired_fps', 'double');
    % 33 51
    % 34 51
    % 35 51
    % 36 51
    % 37 51
    % 38 51
    % 39 51
    % 40 51
    % 41 51
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    p = schema.prop(hThisClass, 'sched_fps', 'double');
    p.AccessFlags.PublicSet = 'off';
    p = schema.prop(hThisClass, 'sched_showCount', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    p = schema.prop(hThisClass, 'sched_skipCount', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    p = schema.prop(hThisClass, 'sched_counter', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 59 61
    % 60 61
    p = schema.prop(hThisClass, 'sched_enable', 'bool');
    p.FactoryValue = false;
    p = schema.prop(hThisClass, 'sched_rateMin', 'double');
    p.FactoryValue = 24.0;
    p = schema.prop(hThisClass, 'sched_rateMax', 'double');
    p.FactoryValue = 32.0;
    p = schema.prop(hThisClass, 'sched_verbose', 'bool');
    p.FactoryValue = false;
    % 69 72
    % 70 72
    % 71 72
    p = schema.prop(hThisClass, 'speedPreset', 'double');
    p.FactoryValue = 1.0;
    p.AccessFlags.PublicSet = 'off';
    % 75 78
    % 76 78
    % 77 78
    presetVals = [.125 .25 .5 .75 1.0 1.5 2.0 3.0 4.0 8.0];
    % 79 80
    p = schema.prop(hThisClass, 'speedPresetCurr', 'MATLAB array');
    p.FactoryValue = presetVals;
    p.AccessFlags.PublicSet = 'off';
    % 83 84
    p = schema.prop(hThisClass, 'speedPresetIncr', 'MATLAB array');
    p.FactoryValue = presetVals(horzcat(2.0:end, end));
    p.AccessFlags.PublicSet = 'off';
    % 87 88
    p = schema.prop(hThisClass, 'speedPresetDecr', 'MATLAB array');
    p.FactoryValue = presetVals(horzcat(1.0, 1.0:minus(end, 1.0)));
    p.AccessFlags.PublicSet = 'off';
    % 91 93
    % 92 93
    p = schema.prop(hThisClass, 'measuredRate', 'double');
    p.FactoryValue = 0.0;
end % function
