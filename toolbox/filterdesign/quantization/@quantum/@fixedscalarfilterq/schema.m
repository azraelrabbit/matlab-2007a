function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedscalarfilterq', findclass(pk, 'abstractfixedoutfilterq'));
    % 10 13
    % 11 13
    % 12 13
    p = schema.prop(c, 'CoeffFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_coefffl, 'GetFunction', @get_coefffl);
    % 15 17
    % 16 17
end % function
