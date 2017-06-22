function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage = findpackage('DataImportExport');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'ReaderBase');
    hCreateInPackage = findpackage('DataImportExport');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'ReaderXML', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 15 17
    % 16 17
    hThisProp = schema.prop(hThisClass, 'DocNode', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 21 22
    hThisProp = schema.prop(hThisClass, 'DocRootNode', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 26 27
    hThisProp = schema.prop(hThisClass, 'XMLRoots', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 31 32
    hThisProp = schema.prop(hThisClass, 'XMLRelations', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 36 37
    hThisProp = schema.prop(hThisClass, 'XMLTopLevel', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 41 42
    hThisProp = schema.prop(hThisClass, 'XMLRootsID', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 46 47
    hThisProp = schema.prop(hThisClass, 'XMLTopLevelID', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 51 52
end % function
