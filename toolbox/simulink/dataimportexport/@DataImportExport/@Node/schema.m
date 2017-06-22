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
    hThisClass = schema.class(hCreateInPackage, 'Node');
    % 13 16
    % 14 16
    % 15 16
    hThisProp = schema.prop(hThisClass, 'Parent', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 20 22
    % 21 22
    hThisProp = schema.prop(hThisClass, 'Name', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 26 28
    % 27 28
    hThisProp = schema.prop(hThisClass, 'Class', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 32 34
    % 33 34
    hThisProp = schema.prop(hThisClass, 'FunctionalType', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 38 40
    % 39 40
    hThisProp = schema.prop(hThisClass, 'ArrayType', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'Unsupported';
    % 46 48
    % 47 48
    hThisProp = schema.prop(hThisClass, 'Dimensions', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 52 54
    % 53 54
    hThisProp = schema.prop(hThisClass, 'RelationID', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 58 61
    % 59 61
    % 60 61
    hThisProp = schema.prop(hThisClass, 'SourceID', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 65 67
    % 66 67
    hThisProp = schema.prop(hThisClass, 'SourceChild', 'handle');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 71 73
    % 72 73
    hThisProp = schema.prop(hThisClass, 'Value', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 77 79
    % 78 79
    hThisProp = schema.prop(hThisClass, 'Children', 'handle vector');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 83 84
end % function
