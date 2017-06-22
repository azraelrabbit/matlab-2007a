function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mlock
    % 10 12
    % 11 12
    hCreateInPackage = findpackage('Simulink');
    % 13 15
    % 14 15
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomStorageClassAttributes');
    % 17 19
    % 18 19
    hThisClass = schema.class(hCreateInPackage, 'CSCTypeAttributes_GetSet', hDeriveFromClass);
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    hThisProp = schema.prop(hThisClass, 'GetFunction', 'string');
    hThisProp = schema.prop(hThisClass, 'SetFunction', 'string');
end % function
