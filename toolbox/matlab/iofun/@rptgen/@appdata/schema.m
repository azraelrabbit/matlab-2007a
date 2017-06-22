function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('rptgen');
    % 8 9
    h = schema.class(pkg, 'appdata', pkg.findclass('rpt_all'));
    % 10 13
    % 11 13
    % 12 13
    findclass(findpackage('handle'), 'listener');
    p = schema.prop(h, 'PropertyListeners', 'handle.listener vector');
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    % 19 20
    p = schema.prop(h, 'StackPrevious', 'handle');
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Reset = 'off';
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    p = schema.prop(h, 'ImplyValues', 'bool');
    p.AccessFlags.Init = 'on';
    p.AccessFlags.PublicSet = 'off';
    p.Visible = 'off';
    p.FactoryValue = true;
end % function
