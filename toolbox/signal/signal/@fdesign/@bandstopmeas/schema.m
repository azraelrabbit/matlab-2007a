function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'bandstopmeas', pk.findclass('abstractmeas'));
    % 10 11
    p = schema.prop(c, 'Fpass1', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 13 14
    p = schema.prop(c, 'F3dB1', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 16 17
    p = schema.prop(c, 'F6dB1', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 19 20
    p = schema.prop(c, 'Fstop1', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 22 23
    p = schema.prop(c, 'Fstop2', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 25 26
    p = schema.prop(c, 'F6dB2', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 28 29
    p = schema.prop(c, 'F3dB2', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 31 32
    p = schema.prop(c, 'Fpass2', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 34 35
    p = schema.prop(c, 'Apass1', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 37 38
    p = schema.prop(c, 'Astop', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 40 41
    p = schema.prop(c, 'Apass2', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 43 44
    p = schema.prop(c, 'TransitionWidth1', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'GetFunction', @get_transitionwidth1);
    % 46 47
    p = schema.prop(c, 'TransitionWidth2', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off', 'GetFunction', @get_transitionwidth2);
end % function
function tw = get_transitionwidth1(this, tw)
    % 51 53
    % 52 53
    tw = minus(get(this, 'Fstop1'), get(this, 'Fpass1'));
end % function
function tw = get_transitionwidth2(this, tw)
    % 56 58
    % 57 58
    tw = minus(get(this, 'Fpass2'), get(this, 'Fstop2'));
end % function
