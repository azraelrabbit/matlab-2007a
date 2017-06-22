function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'firwinoptionsframe', pk.findclass('sigcontainer'));
    % 11 13
    % 12 13
    p = schema.prop(c, 'Scale', 'on/off');
    set(p, 'Description', 'Scale Passband', 'FactoryValue', 'on');
    % 15 16
    findclass(findpackage('spectrum'), 'periodogram');
    % 17 18
    p = schema.prop(c, 'Window', 'SignalSpectrumWindowList');
    set(p, 'SetFunction', @set_window, 'GetFunction', @get_window);
    % 20 21
    p = schema.prop(c, 'FunctionName', 'string');
    % 22 23
    p = schema.prop(c, 'Parameter', 'string');
    set(p, 'FactoryValue', '.5');
    % 25 26
    findclass(findpackage('sigwin'), 'window');
    p = schema.prop(c, 'privWindow', 'sigwin.window');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 29 30
    schema.prop(c, 'isMinOrder', 'bool');
    % 31 33
    % 32 33
    schema.event(c, 'OrderRequested');
end % function
