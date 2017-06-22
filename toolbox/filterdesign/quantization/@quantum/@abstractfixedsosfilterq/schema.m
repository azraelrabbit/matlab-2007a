function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('quantum');
    c = schema.class(pk, 'abstractfixedsosfilterq', findclass(pk, 'abstractfixediirfilterq'));
    set(c, 'Description', 'abstract');
    % 11 12
    p = schema.prop(c, 'ScaleValueFracLength', 'mxArray');
    set(p, 'AccessFlags.Init', 'off', 'SetFunction', @set_svfl, 'GetFunction', @get_svfl);
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(c, 'privcoefffl3', 'int32');
    set(p, 'FactoryValue', 15.0, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
    % 20 21
end % function
