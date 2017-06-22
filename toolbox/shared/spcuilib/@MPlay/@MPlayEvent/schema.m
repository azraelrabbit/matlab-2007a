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
    thisPackage = findpackage('MPlay');
    thisClass = schema.class(thisPackage, 'MPlayEvent', inheritFromClass);
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(thisClass, 'Data', 'MATLAB array');
    p.FactoryValue = [];
end % function
