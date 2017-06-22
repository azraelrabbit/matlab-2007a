function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hDeriveFromPackage = findpackage('DAStudio');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'Object');
    hCreateInPackage = findpackage('MPlay');
    hThisClass = schema.class(hCreateInPackage, 'DialogBase', hDeriveFromClass);
    % 11 14
    % 12 14
    % 13 14
    MPlay.RegisterDDGMethods(hThisClass);
    % 15 18
    % 16 18
    % 17 18
    pk = findpackage('hg');
    p = schema.prop(hThisClass, 'hfig', 'hg.figure');
    p.AccessFlags.PublicSet = 'off';
    % 21 22
    p = schema.prop(hThisClass, 'dialog', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    % 24 25
    p = schema.prop(hThisClass, 'titleStr', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 27 28
    p = schema.prop(hThisClass, 'fullTitleStr', 'string');
    p.AccessFlags.PublicSet = 'off';
    % 30 31
    p = schema.prop(hThisClass, 'instance', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 33 34
    p = schema.prop(hThisClass, 'DialogPosition', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    % 36 39
    % 37 39
    % 38 39
    p = schema.prop(hThisClass, 'FigureListener', 'handle.listener vector');
    p.AccessFlags.PublicSet = 'off';
    % 41 42
    p = schema.prop(hThisClass, 'listen_DataSourceChange', 'handle.listener');
    p.AccessFlags.PublicSet = 'off';
end % function
