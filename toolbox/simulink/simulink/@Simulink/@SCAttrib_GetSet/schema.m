function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomStorageClassAttributes');
    hCreateInPackage = findpackage('Simulink');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'SCAttrib_GetSet', hDeriveFromClass);
    % 14 16
    % 15 16
    hThisProp = schema.prop(hThisClass, 'GetFunction', 'string');
    hThisProp = schema.prop(hThisClass, 'SetFunction', 'string');
    hThisProp = schema.prop(hThisClass, 'HeaderFile', 'string');
    % 19 21
    % 20 21
    if isempty(findtype('SCAttrib_GetSet_IncludeDelimeter'))
        schema.EnumType('SCAttrib_GetSet_IncludeDelimeter', {'Quotes';'Braces'});
    else
        % 24 25
        % 25 26
        warning('A type named ''SCAttrib_GetSet_IncludeDelimeter'' already exists.');
    end % if
    % 28 29
    hThisProp = schema.prop(hThisClass, 'IncludeDelimeter', 'SCAttrib_GetSet_IncludeDelimeter');
end % function
