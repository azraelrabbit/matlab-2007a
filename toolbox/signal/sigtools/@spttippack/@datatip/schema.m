function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('spttippack');
    % 10 12
    % 11 12
    c = schema.class(pk, 'datatip');
    % 13 15
    % 14 15
    schema.prop(c, 'Parent', 'handle');
    schema.prop(c, 'MarkerHandle', 'handle');
    schema.prop(c, 'TipHandle', 'handle');
    schema.prop(c, 'UIContextMenu', 'handle');
    % 19 20
    p = schema.prop(c, 'Marker', 'string');
    set(p, 'FactoryValue', 's');
    % 22 23
    p = schema.prop(c, 'Movable', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 25 26
    p = schema.prop(c, 'Selected', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 28 29
    schema.prop(c, 'TipPosition', 'string');
    schema.prop(c, 'TipFcn', 'MATLAB array');
    % 31 32
    p = schema.prop(c, 'X', 'double');
    set(p, 'FactoryValue', 0.0);
    p = schema.prop(c, 'Y', 'double');
    set(p, 'FactoryValue', 0.0);
    p = schema.prop(c, 'Z', 'double');
    set(p, 'FactoryValue', 0.0);
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 40 41
    p = schema.prop(c, 'TipVisible', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 43 44
    p = schema.prop(c, 'Visible', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 46 47
    p = schema.prop(c, 'ZStacking', 'on/off');
    set(p, 'FactoryValue', 'on');
    % 49 50
    p = schema.prop(c, 'ZStackMinimum', 'double');
    set(p, 'FactoryValue', 10.0);
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    p = schema.prop(c, 'TipListeners', 'MATLAB array');
    p = schema.prop(c, 'AxFigListeners', 'MATLAB array');
end % function
