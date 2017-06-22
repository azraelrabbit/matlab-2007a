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
    hThisClass = schema.class(hCreateInPackage, 'WriterExcel', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 15 17
    % 16 17
    hThisProp = schema.prop(hThisClass, 'WriteList', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 21 22
    hThisProp = schema.prop(hThisClass, 'WriteDepth', 'double');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 1.0;
    % 28 29
    hThisProp = schema.prop(hThisClass, 'WriteTopLevelObjectClasses', 'bool');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = true;
    % 35 36
    hThisProp = schema.prop(hThisClass, 'WriteSubLevelObjectClasses', 'bool');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = true;
    % 42 43
    hThisProp = schema.prop(hThisClass, 'PageOutput', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 47 48
    hThisProp = schema.prop(hThisClass, 'PageDescription', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 52 53
    hThisProp = schema.prop(hThisClass, 'PageNumber', 'double');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 59 60
end % function
