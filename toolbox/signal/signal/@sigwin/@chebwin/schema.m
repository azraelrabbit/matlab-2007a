function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('sigwin');
    % 9 10
    c = schema.class(pk, 'chebwin', pk.findclass('parameterizewin'));
    % 11 13
    % 12 13
    p = schema.prop(c, 'Name', 'string');
    set(p, 'AccessFlags.PublicSet', 'Off', 'FactoryValue', 'Chebyshev');
    % 15 17
    % 16 17
    p = schema.prop(c, 'Sidelobe_atten', 'double');
    set(p, 'Visible', 'Off', 'AccessFlags.Init', 'Off', 'AccessFlags.Serialize', 'Off', 'SetFunction', @setsidelobe_atten, 'GetFunction', @getsidelobe_atten);
    % 19 22
    % 20 22
    % 21 22
end % function
function sa = setsidelobe_atten(this, sa)
    % 24 27
    % 25 27
    % 26 27
    warning(generatemsgid('DeprecatedProperty'), 'Sidelobe_atten has been deprecated, use SidelobeAtten instead.');
    % 28 30
    % 29 30
    set(this, 'SidelobeAtten', sa);
    sa = [];
end % function
function sa = getsidelobe_atten(this, sa)
    % 34 36
    % 35 36
    warning(generatemsgid('DeprecatedProperty'), 'Sidelobe_atten has been deprecated, use SidelobeAtten instead.');
    % 37 39
    % 38 39
    sa = get(this, 'SidelobeAtten');
end % function
