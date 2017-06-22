function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomRTWInfo');
    hCreateInPackage = findpackage('mpt');
    % 11 13
    % 12 13
    hThisClass = schema.class(hCreateInPackage, 'CustomRTWInfoParameter', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 15 17
    % 16 17
    if isempty(findtype('mpt_CustomStorageClassList_for_Parameter'))
        cscList = processcsc('GetNamesForParameter', 'mpt');
        schema.EnumType('mpt_CustomStorageClassList_for_Parameter', cscList);
    else
        warning('A type named ''mpt_CustomStorageClassList_for_Parameter'' already exists.');
    end % if
    % 23 25
    % 24 25
    hThisProp = schema.prop(hThisClass, 'CustomStorageClass', 'mpt_CustomStorageClassList_for_Parameter');
    % 26 28
    % 27 28
    hThisProp = schema.prop(hThisClass, 'CustomAttributes', 'Simulink.BaseCSCAttributes');
    % 29 31
    % 30 31
    createcsclisteners(hThisClass);
end % function
