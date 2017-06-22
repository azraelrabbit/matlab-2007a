function schema
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    hCreateInPackage = findpackage('SLDataClassDesign');
    % 19 22
    % 20 22
    hThisClass = schema.class(hCreateInPackage, 'PackageDefn');
    % 22 25
    % 23 25
    hThisProp = schema.prop(hThisClass, 'PackageName', 'string');
    % 25 27
    hThisProp = schema.prop(hThisClass, 'PackageDir', 'string');
    % 27 29
    hThisProp = schema.prop(hThisClass, 'OrigPackageDir', 'string');
    % 29 31
    hThisProp = schema.prop(hThisClass, 'Classes', 'handle vector');
    % 31 33
    hThisProp = schema.prop(hThisClass, 'OldRTWInfoClasses', 'handle vector');
    % 33 35
    hThisProp = schema.prop(hThisClass, 'EnumTypes', 'handle vector');
    % 35 37
    hThisProp = schema.prop(hThisClass, 'OldEnumTypes', 'handle vector');
    % 37 39
    hThisProp = schema.prop(hThisClass, 'CSCHandlingMode', 'SLDataClassDesign_CSCHandlingMode');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'v1 - Manually defined';
    % 41 43
    hThisProp = schema.prop(hThisClass, 'CustomStorageClasses', 'handle vector');
    % 43 45
    hThisProp = schema.prop(hThisClass, 'ReadOnly', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 47 49
    hThisProp = schema.prop(hThisClass, 'Modified', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
end
