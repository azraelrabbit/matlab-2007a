function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage = findpackage('DataImportExport');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'IntermediateBase');
    hCreateInPackage = findpackage('DataImportExport');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'IntermediateExcel', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 15 18
    % 16 18
    % 17 18
end % function
