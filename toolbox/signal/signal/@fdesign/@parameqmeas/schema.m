function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'parameqmeas', pk.findclass('abstractparameqmeas'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'Gref', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 14 15
    p = schema.prop(c, 'G0', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 17 18
    p = schema.prop(c, 'Gpass', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 20 21
    p = schema.prop(c, 'Gstop', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
end % function
