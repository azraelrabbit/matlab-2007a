function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedlatticefilterq', pk.findclass('abstractfixedlatticefilterq'));
    % 10 12
    % 11 12
    p = schema.prop(c, 'ProductFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_prodfl, 'GetFunction', @get_prodfl);
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'AccumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_accumfl, 'GetFunction', @get_accumfl);
    % 19 20
end % function
