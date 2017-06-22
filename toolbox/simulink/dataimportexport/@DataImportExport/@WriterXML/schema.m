function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage = findpackage('DataImportExport');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'WriterBase');
    hCreateInPackage = findpackage('DataImportExport');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'WriterXML', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 15 16
    hThisProp = schema.prop(hThisClass, 'DocNode', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 20 21
    hThisProp = schema.prop(hThisClass, 'DocRootNode', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 25 26
    hThisProp = schema.prop(hThisClass, 'UserObjectRootsNode', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 30 31
    hThisProp = schema.prop(hThisClass, 'RelationsNode', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 35 36
    hThisProp = schema.prop(hThisClass, 'DataContentNode', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 40 41
end % function
