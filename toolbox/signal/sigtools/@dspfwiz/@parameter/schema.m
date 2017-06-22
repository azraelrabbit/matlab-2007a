function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('dspfwiz');
    % 8 9
    c = schema.class(pk, 'parameter');
    c.Description = 'Parameter';
    % 11 13
    % 12 13
    p = schema.prop(c, 'targetObj', 'dspfwiztargets.abstracttarget');
    p.AccessFlags.PublicSet = 'off';
    p.Visible = 'off';
    % 16 18
    % 17 18
    p = schema.prop(c, 'libraryProps', 'schema.prop vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 21 23
    % 22 23
    p = schema.prop(c, 'listeners', 'handle.listener vector');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    % 26 28
    % 27 28
    p = schema.prop(c, 'dynamicProps', 'schema.prop vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 31 33
    % 32 33
    p = schema.prop(c, 'dynamicPropsListener', 'handle.listener vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
