function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    packageName = 'Simulink';
    % 13 15
    % 14 15
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomRTWInfo');
    hCreateInPackage = findpackage(packageName);
    % 18 20
    % 19 20
    hThisClass = schema.class(hCreateInPackage, 'CustomSignalRTWInfo', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 22 24
    % 23 24
    if isempty(findtype('BuiltInCustomSignalStorageClasses'))
        enumList = processcsc('GetNamesForSignal', packageName);
        schema.EnumType('BuiltInCustomSignalStorageClasses', enumList);
    else
        warning('A type named ''BuiltInCustomSignalStorageClasses'' already exists.');
    end % if
    % 30 32
    % 31 32
    hThisProp = schema.prop(hThisClass, 'CustomStorageClass', 'BuiltInCustomSignalStorageClasses');
    % 33 35
    % 34 35
    hThisProp = schema.prop(hThisClass, 'CustomAttributes', 'Simulink.BaseCSCAttributes');
    % 36 38
    % 37 38
    createcsclisteners(hThisClass);
end % function
