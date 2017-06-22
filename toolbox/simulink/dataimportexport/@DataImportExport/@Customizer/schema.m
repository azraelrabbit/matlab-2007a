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
    hThisClass = schema.class(hCreateInPackage, 'Customizer');
    % 13 15
    % 14 15
    hThisProp = schema.prop(hThisClass, 'ClassTransform', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 19 21
    % 20 21
    hThisProp = schema.prop(hThisClass, 'NameTransform', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 25 26
    hThisProp = schema.prop(hThisClass, 'IncludeTransform', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 30 32
    % 31 32
    hThisProp = schema.prop(hThisClass, 'ReadFunction', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
    % 36 37
    hThisProp = schema.prop(hThisClass, 'WriteFunction', 'MATLAB array');
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.AccessFlags.Serialize = 'off';
end % function
