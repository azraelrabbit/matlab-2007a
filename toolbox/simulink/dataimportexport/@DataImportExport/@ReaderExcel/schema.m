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
    hThisClass = schema.class(hCreateInPackage, 'ReaderExcel', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 15 17
    % 16 17
    hThisProp = schema.prop(hThisClass, 'PageInput', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 21 22
    hThisProp = schema.prop(hThisClass, 'PageDescription', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 26 27
    hThisProp = schema.prop(hThisClass, 'CurrentPageDescription', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 31 32
    hThisProp = schema.prop(hThisClass, 'CurrentPageNumber', 'double');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 38 39
    hThisProp = schema.prop(hThisClass, 'CurrentPage', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 43 44
    hThisProp = schema.prop(hThisClass, 'SourceObjectsLastIndex', 'double');
    % 45 47
    % 46 47
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 50 51
end % function
