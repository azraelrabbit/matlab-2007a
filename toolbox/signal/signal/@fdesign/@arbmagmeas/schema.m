function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    pk = findpackage('fdesign');
    c = schema.class(pk, 'arbmagmeas', pk.findclass('abstractmeas'));
    % 11 12
    p = schema.prop(c, 'Frequencies', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 14 15
    p = schema.prop(c, 'Amplitudes', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
end % function
