function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'highpassmeas', pk.findclass('abstractmeas'));
    % 10 11
    p = schema.prop(c, 'Fstop', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 13 14
    p = schema.prop(c, 'F6dB', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 16 17
    p = schema.prop(c, 'F3dB', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 19 20
    p = schema.prop(c, 'Fpass', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 22 23
    p = schema.prop(c, 'Astop', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 25 26
    p = schema.prop(c, 'Apass', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 28 29
    p = schema.prop(c, 'TransitionWidth', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'GetFunction', @get_transitionwidth);
end % function
function tw = get_transitionwidth(this, tw)
    % 33 35
    % 34 35
    tw = minus(get(this, 'Fpass'), get(this, 'Fstop'));
end % function
