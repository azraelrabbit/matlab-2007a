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
    hThisClass = schema.class(hCreateInPackage, 'Serializer');
    % 13 15
    % 14 15
    hThisProp = schema.prop(hThisClass, 'SerializationType', 'string');
    hThisProp.FactoryValue = 'Excel';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.SetFunction = @s_SetFcn_SerializationType;
    % 22 24
    % 23 24
    hThisProp = schema.prop(hThisClass, 'Intermediate', 'handle');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 28 29
    hThisProp = schema.prop(hThisClass, 'Customizer', 'handle');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 33 35
    % 34 35
    hThisProp = schema.prop(hThisClass, 'Writer', 'handle');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 39 40
    hThisProp = schema.prop(hThisClass, 'Reader', 'handle');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 44 45
    hThisProp = schema.prop(hThisClass, 'Options', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 49 51
    % 50 51
    hThisProp = schema.prop(hThisClass, 'Arrays', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 55 57
    % 56 57
    hThisProp = schema.prop(hThisClass, 'ArrayNames', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 61 63
    % 62 63
    hThisProp = schema.prop(hThisClass, 'Workspace', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 67 69
    % 68 69
    hThisProp = schema.prop(hThisClass, 'WriteFileName', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 73 75
    % 74 75
    hThisProp = schema.prop(hThisClass, 'ReadFileName', 'string');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 79 81
    % 80 81
    hThisProp = schema.prop(hThisClass, 'OverwriteFlag', 'bool');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 85 87
    % 86 87
end % function
function ActualValue = s_SetFcn_SerializationType(hEDSObject, NewValue)
    % 89 101
    % 90 101
    % 91 101
    % 92 101
    % 93 101
    % 94 101
    % 95 101
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    % 100 101
    switch lower(NewValue)
    case 'excel'
        ActualValue = 'Excel';
    case 'xmldom'
        % 105 106
        ActualValue = 'XMLDOM';
    otherwise
        % 108 111
        % 109 111
        % 110 111
        % 111 113
        % 112 113
        ActualValue = '';
        % 114 116
        % 115 116
        error('DataImportExport:FormatUnsupported', sprintf('Currently only ''Excel'' or ''XMLDOM'' are supported file format'));
        % 117 119
        % 118 119
    end % switch
    % 120 121
end % function
