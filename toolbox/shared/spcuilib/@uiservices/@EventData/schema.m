function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    inheritFromPackage = findpackage('handle');
    inheritFromClass = findclass(inheritFromPackage, 'EventData');
    thisPackage = findpackage('uiservices');
    thisClass = schema.class(thisPackage, 'EventData', inheritFromClass);
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(thisClass, 'Data', 'MATLAB array');
    p.FactoryValue = [];
end % function
