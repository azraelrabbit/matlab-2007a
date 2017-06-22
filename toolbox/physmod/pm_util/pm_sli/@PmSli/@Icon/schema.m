function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('PmSli');
    hThisClass = schema.class(hCreateInPackage, 'Icon');
    % 9 10
    p = schema.prop(hThisClass, 'Display', 'string');
    p = schema.prop(hThisClass, 'Size', 'point');
    p = schema.prop(hThisClass, 'ShowFrame', 'bool');
    p = schema.prop(hThisClass, 'ShowName', 'bool');
    p = schema.prop(hThisClass, 'RequiredFiles', 'string vector');
    % 15 16
end % function
