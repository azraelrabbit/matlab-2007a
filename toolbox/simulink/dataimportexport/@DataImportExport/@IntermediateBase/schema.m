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
    hThisClass = schema.class(hCreateInPackage, 'IntermediateBase');
    % 13 15
    % 14 15
    hThisProp = schema.prop(hThisClass, 'ArrayNodeList', 'handle vector');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 19 20
    hThisProp = schema.prop(hThisClass, 'ArrayNodeListLastIndex', 'double');
    % 21 23
    % 22 23
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 26 28
    % 27 28
    hThisProp = schema.prop(hThisClass, 'SourceObjects', 'handle vector');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 32 33
    hThisProp = schema.prop(hThisClass, 'SourceObjectsProcessedFlag', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 37 39
    % 38 39
    hThisProp = schema.prop(hThisClass, 'SourceObjectsID', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 43 45
    % 44 45
    hThisProp = schema.prop(hThisClass, 'SourceObjectsRelationID', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 49 51
    % 50 51
    hThisProp = schema.prop(hThisClass, 'SourceObjectsLastIndex', 'double');
    % 52 54
    % 53 54
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 57 59
    % 58 59
    hThisProp = schema.prop(hThisClass, 'RelationIDMap', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 63 65
    % 64 65
    hThisProp = schema.prop(hThisClass, 'RelationIDLastIndex', 'double');
    % 66 68
    % 67 68
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    % 76 77
    hThisProp = schema.prop(hThisClass, 'ArrayQueue', 'MATLAB array');
    % 78 80
    % 79 80
    hThisProp.AccessFlags.Serialize = 'off';
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    % 85 86
    hThisProp = schema.prop(hThisClass, 'ArrayQueueFirstIndex', 'double');
    % 87 89
    % 88 89
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    % 96 97
    hThisProp = schema.prop(hThisClass, 'ArrayQueueLastIndex', 'double');
    % 98 100
    % 99 100
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 0.0;
    % 103 105
    % 104 105
end % function
