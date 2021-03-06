function schema
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomRTWInfo');
    hCreateInPackage = findpackage('ECoderDemos');
    % 21 23
    % 22 23
    hThisClass = schema.class(hCreateInPackage, 'CustomRTWInfo_Parameter', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 25 27
    % 26 27
    if isempty(findtype('ECoderDemos_CustomStorageClassList_for_Parameter'))
        cscList = processcsc('GetNamesForParameter', 'ECoderDemos');
        schema.EnumType('ECoderDemos_CustomStorageClassList_for_Parameter', cscList);
    else
        warning('A type named ''ECoderDemos_CustomStorageClassList_for_Parameter'' already exists.');
    end % if
    % 33 35
    % 34 35
    hThisProp = schema.prop(hThisClass, 'CustomStorageClass', 'ECoderDemos_CustomStorageClassList_for_Parameter');
    % 36 38
    % 37 38
    hThisProp = schema.prop(hThisClass, 'CustomAttributes', 'Simulink.BaseCSCAttributes');
    % 39 41
    % 40 41
    createcsclisteners(hThisClass);
end % function
