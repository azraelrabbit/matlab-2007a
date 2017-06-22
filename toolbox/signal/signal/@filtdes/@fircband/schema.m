function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('filtdes');
    % 9 10
    c = schema.class(pk, 'fircband', pk.findclass('abstractgremez'));
    % 11 12
    p = schema.prop(c, 'ConstrainedBands', 'double_vector');
    set(p, 'SetFunction', @setcbands, 'GetFunction', @getcbands);
    % 14 15
    p = schema.prop(c, 'privConstrainedBands', 'double_vector');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
