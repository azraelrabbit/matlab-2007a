function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage = findpackage('schema');
    % 9 10
    hDeriveFromClass = findclass(hDeriveFromPackage, 'prop');
    % 11 13
    % 12 13
    hThisPackage = findpackage('RTWConfiguration');
    % 14 15
    hThisClass = schema.class(hThisPackage, 'DependencyProp', hDeriveFromClass);
    % 16 18
    % 17 18
    hThisProp = schema.prop(hThisClass, 'ActivateValue', 'string');
    hThisProp.AccessFlags.Init = 'on';
    % 20 22
    % 21 22
    hThisProp = schema.prop(hThisClass, 'Dependencies', 'handle vector');
    hThisProp.AccessFlags.PublicSet = 'off';
    hThisProp.AccessFlags.PublicGet = 'off';
end % function
