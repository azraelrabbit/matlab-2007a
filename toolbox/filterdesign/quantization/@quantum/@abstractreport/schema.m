function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractreport');
    set(c, 'Description', 'abstract');
    % 11 12
    findclass(pk, 'abstractlog');
    % 13 14
    p = schema.prop(c, 'DataType', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 16 19
    % 17 19
    % 18 19
    p = schema.prop(c, 'Input', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
    % 21 23
    % 22 23
    p = schema.prop(c, 'Output', 'quantum.abstractlog');
    set(p, 'AccessFlags.Init', 'off', 'AccessFlags.PublicSet', 'off');
end % function
