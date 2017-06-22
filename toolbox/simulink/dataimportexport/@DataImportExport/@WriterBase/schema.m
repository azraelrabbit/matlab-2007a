function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('DataImportExport');
    % 10 12
    % 11 12
    hThisClass = schema.class(hCreateInPackage, 'WriterBase');
    % 13 15
    % 14 15
    hThisProp = schema.prop(hThisClass, 'FileName', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 19 20
    hThisProp = schema.prop(hThisClass, 'LayoutInfo', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 24 25
    hThisProp = schema.prop(hThisClass, 'IncludeOrder', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 29 30
    hThisProp = schema.prop(hThisClass, 'SourceObjectsID', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 34 36
    % 35 36
end % function
