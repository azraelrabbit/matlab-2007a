function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstractarbmag', pk.findclass('abstracttypewspecs'));
    set(c, 'Description', 'abstract');
    % 11 13
    % 12 13
    p = schema.prop(c, 'BandListener', 'handle.listener vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
