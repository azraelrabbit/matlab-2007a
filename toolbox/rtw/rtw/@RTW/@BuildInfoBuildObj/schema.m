function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hCreateInPackage = findpackage('RTW');
    hBaseClass = findclass(hCreateInPackage, 'BuildInfoClass');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'BuildInfoBuildObj', hBaseClass);
    % 14 16
    % 15 16
    hThisProp = schema.prop(hThisClass, 'Options', 'handle');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'Inc', 'handle');
    hThisProp.FactoryValue = [];
    hThisProp = schema.prop(hThisClass, 'Src', 'handle');
    hThisProp.FactoryValue = [];
end % function
