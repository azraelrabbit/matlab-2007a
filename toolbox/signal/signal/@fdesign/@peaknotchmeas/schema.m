function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'peaknotchmeas', pk.findclass('abstractparameqmeas'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'Q', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 14 15
    p = schema.prop(c, 'Apass', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 17 18
    p = schema.prop(c, 'Astop', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
end % function
