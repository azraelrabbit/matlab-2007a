function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstractparameqmeas', pk.findclass('abstractmeas'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'F0', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 14 15
    p = schema.prop(c, 'BW', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 17 18
    p = schema.prop(c, 'BWpass', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 20 21
    p = schema.prop(c, 'BWstop', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 23 24
    p = schema.prop(c, 'Flow', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 26 27
    p = schema.prop(c, 'Fhigh', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 29 30
    p = schema.prop(c, 'GBW', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 32 34
    % 33 34
    p = schema.prop(c, 'LowTransitionWidth', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 36 38
    % 37 38
    p = schema.prop(c, 'HighTransitionWidth', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
end % function
