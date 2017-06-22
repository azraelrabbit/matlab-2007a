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
    hThisClass = schema.class(hCreateInPackage, 'ClassDefn');
    % 22 25
    % 23 25
    hThisProp = schema.prop(hThisClass, 'ClassName', 'string');
    % 25 27
    hThisProp = schema.prop(hThisClass, 'DeriveFromPackage', 'string');
    % 27 29
    hThisProp = schema.prop(hThisClass, 'DeriveFromClass', 'string');
    % 29 31
    hThisProp = schema.prop(hThisClass, 'DerivedProperties', 'handle vector');
    % 31 33
    hThisProp = schema.prop(hThisClass, 'LocalProperties', 'handle vector');
    % 33 35
    hThisProp = schema.prop(hThisClass, 'Initialization', 'string');
    % 35 37
    hThisProp = schema.prop(hThisClass, 'UseCSCRegFile', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
end
