function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('spectrum');
    % 9 10
    c = schema.class(pk, 'abstractspecwwindow', findclass(pk, 'abstractspectrum'));
    % 11 13
    % 12 13
    findclass(findpackage('sigwin'), 'window');
    p = schema.prop(c, 'Window', 'sigwin.window');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    set(p, 'SetFunction', @setwinobj);
    % 17 19
    % 18 19
    if isempty(findtype('SignalSpectrumWindowList'))
        [winclasses, winnames] = findallwinclasses;
        schema.EnumType('SignalSpectrumWindowList', winnames(1.0:minus(end, 1.0)));
    end % if
    p = schema.prop(c, 'WindowName', 'SignalSpectrumWindowList');
    p.FactoryValue = 'rectangular';
    set(p, 'SetFunction', @setwindowname);
    % 26 28
    % 27 28
    p = schema.prop(c, 'WindowParameters', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
