function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'octavemeas', pk.findclass('abstractmeas'));
    % 10 11
    p = schema.prop(c, 'Frequencies', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 13 14
    p = schema.prop(c, 'Magnitudes', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
end % function
