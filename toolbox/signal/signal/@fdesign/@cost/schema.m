function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'cost');
    % 10 11
    p = schema.prop(c, 'NMult', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 13 14
    p = schema.prop(c, 'NAdd', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 16 17
    p = schema.prop(c, 'NStates', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 19 20
    p = schema.prop(c, 'MultPerInputSample', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 22 23
    p = schema.prop(c, 'AddPerInputSample', 'mxArray');
    set(p, 'AccessFlags.PublicSet', 'Off');
end % function
