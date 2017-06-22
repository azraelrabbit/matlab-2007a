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
    hThisClass = schema.class(hCreateInPackage, 'ReaderBase');
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
    hThisProp = schema.prop(hThisClass, 'ArrayID', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 29 30
    hThisProp = schema.prop(hThisClass, 'ArrayName', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 34 35
    hThisProp = schema.prop(hThisClass, 'ArrayNodeList', 'handle vector');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 39 40
    hThisProp = schema.prop(hThisClass, 'SourceNodes', 'handle vector');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 44 45
    hThisProp = schema.prop(hThisClass, 'SourceNodesID', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 49 50
    hThisProp = schema.prop(hThisClass, 'ReferenceNodes', 'handle vector');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 54 55
    hThisProp = schema.prop(hThisClass, 'IncludeOrder', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
end % function
