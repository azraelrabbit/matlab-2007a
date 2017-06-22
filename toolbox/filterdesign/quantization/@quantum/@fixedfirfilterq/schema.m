function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'fixedfirfilterq', pk.findclass('abstractfixednonscalarfilterq'));
    % 9 12
    % 10 12
    p = schema.prop(c, 'NumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', cellhorzcat(@set_numfl, 'NumFracLength'), 'GetFunction', @get_numfl);
    % 13 17
    % 14 17
    % 15 17
    p = schema.prop(c, 'ProductFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_prodfl, 'GetFunction', @get_prodfl);
    % 18 22
    % 19 22
    % 20 22
    p = schema.prop(c, 'AccumFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'Off', 'SetFunction', @set_accumfl, 'GetFunction', @get_accumfl);
    % 23 25
end % function
