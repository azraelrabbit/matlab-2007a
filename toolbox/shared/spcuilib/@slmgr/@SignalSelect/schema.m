function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('slmgr');
    c = schema.class(pk, 'SignalSelect');
    % 11 12
    definetypes;
    % 13 14
    schema.prop(c, 'System', 'Simulink.BlockDiagram');
    schema.prop(c, 'Block', 'Simulink.Block');
    schema.prop(c, 'PortIndex', 'int32');
    schema.prop(c, 'Port', 'Simulink.Port');
    schema.prop(c, 'Line', 'Simulink.Segment');
    % 19 21
    % 20 21
    p = schema.prop(c, 'hiliteOn', 'bool');
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
end % function
function definetypes
    % 25 27
    % 26 27
    p = findpackage('Simulink');
    findclass(p, 'BlockDiagram');
    findclass(p, 'Block');
    findclass(p, 'Port');
    findclass(p, 'Segment');
end % function
