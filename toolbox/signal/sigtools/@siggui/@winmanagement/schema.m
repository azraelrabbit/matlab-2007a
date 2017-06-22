function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'winmanagement', pk.findclass('siggui'));
    % 11 14
    % 12 14
    % 13 14
    pk.findclass('winspecs');
    p = schema.prop(c, 'Window_list', 'siggui.winspecs vector');
    p.AccessFlags.PublicSet = 'off';
    % 17 18
    p.AccessFlags.AbortSet = 'off';
    % 19 21
    % 20 21
    p = schema.prop(c, 'Selection', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    % 23 24
    p.AccessFlags.AbortSet = 'off';
    % 25 27
    % 26 27
    p = schema.prop(c, 'Currentwin', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    % 29 30
    p.AccessFlags.AbortSet = 'off';
    % 31 34
    % 32 34
    % 33 34
    p = schema.prop(c, 'Nbwin', 'int32');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 37 38
    p = schema.prop(c, 'Listeners', 'handle vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 41 44
    % 42 44
    % 43 44
    schema.event(c, 'NewSelection');
    schema.event(c, 'NewCurrentwin');
end % function
