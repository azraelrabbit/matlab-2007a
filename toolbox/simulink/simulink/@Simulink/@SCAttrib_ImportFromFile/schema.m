function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'BuiltinCSCAttributes');
    hCreateInPackage = findpackage('Simulink');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'SCAttrib_ImportFromFile', hDeriveFromClass);
    % 14 16
    % 15 16
    hThisProp = schema.prop(hThisClass, 'HeaderFile', 'string');
    hThisProp.FactoryValue = '';
end % function
