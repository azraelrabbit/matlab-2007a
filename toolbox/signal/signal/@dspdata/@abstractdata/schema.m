function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspdata');
    c = schema.class(pk, 'abstractdata');
    set(c, 'Description', 'abstract');
    % 11 13
    % 12 13
    p = schema.prop(c, 'Name', 'String');
    set(p, 'AccessFlag.PublicSet', 'off');
    % 15 16
    p = schema.prop(c, 'Data', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'off', 'SetFunction', @set_data);
end % function
