function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hCreateInPackage = findpackage('Simulink');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'DeviceAttrib_Microprocessor');
    % 14 16
    % 15 16
    hThisProp = schema.prop(hThisClass, 'BitsPerChar', 'int32');
    hThisProp.FactoryValue = 8.0;
    % 18 19
    hThisProp = schema.prop(hThisClass, 'BitsPerShort', 'int32');
    hThisProp.FactoryValue = 16.0;
    % 21 22
    hThisProp = schema.prop(hThisClass, 'BitsPerInt', 'int32');
    hThisProp.FactoryValue = 32.0;
    % 24 25
    hThisProp = schema.prop(hThisClass, 'BitsPerLong', 'int32');
    hThisProp.FactoryValue = 32.0;
end % function
