function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg_das = findpackage('DAStudio');
    hDeriveFromClass = findclass(pkg_das, 'Object');
    % 9 10
    pkg_uisvc = findpackage('uiservices');
    hThisClass = schema.class(pkg_uisvc, 'DialogBase', hDeriveFromClass);
    % 12 15
    % 13 15
    % 14 15
    uiservices.RegisterDDGMethods(hThisClass);
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    p = schema.prop(hThisClass, 'hAppInst', 'handle');
    p.AccessFlags.PublicSet = 'off';
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(hThisClass, 'HelpArgs', 'mxArray');
    p.FactoryValue = {''};
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(hThisClass, 'TitlePrefix', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 38 40
    % 39 40
    schema.prop(hThisClass, 'TitleSuffix', 'string');
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    p = schema.prop(hThisClass, 'Dialog', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    p.Visible = 'off';
    % 50 53
    % 51 53
    % 52 53
    p = schema.prop(hThisClass, 'DialogPosition', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    p.Visible = 'off';
    % 56 58
    % 57 58
    p = schema.prop(hThisClass, 'Listen_Client', 'handle.listener vector');
    p.AccessFlags.PublicSet = 'off';
    p.Visible = 'off';
end % function
