function createcsclisteners(hThisClass)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    l_EnforceThatCustomAttributesIsAfterCustomStorageClass(hThisClass);
    % 11 13
    hSLRTWInfoClass = findclass(findpackage('Simulink'), 'RTWInfo');
    % 13 16
    % 14 16
    hSLRTWInfoSCProp = findprop(hSLRTWInfoClass, 'StorageClass');
    hSCProp = findprop(hThisClass, 'StorageClass');
    hSCListener = handle.listener(hSLRTWInfoClass, hSLRTWInfoSCProp, 'PropertyPostSet', @SCListener);
    % 18 20
    schema.prop(hSCProp, 'SC_Listener', 'handle');
    hSCProp.SC_Listener = hSCListener;
    % 21 24
    % 22 24
    hCSCProp = findprop(hThisClass, 'CustomStorageClass');
    hCSCListener = handle.listener(hThisClass, hCSCProp, 'PropertyPostSet', @CSCListener);
    % 25 27
    schema.prop(hCSCProp, 'CSC_Listener', 'handle');
    hCSCProp.CSC_Listener = hCSCListener;
end % function
function SCListener(src, eventData)
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    storageclasschanged(eventData.AffectedObject);
end % function
function CSCListener(src, eventData)
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    CustomStorageClassListener(eventData.AffectedObject);
end % function
function l_EnforceThatCustomAttributesIsAfterCustomStorageClass(hThisClass)
    % 46 55
    % 47 55
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    propStruct = hThisClass.Properties.get;
    propNames = ctranspose(cellhorzcat(propStruct(:).Name));
    cscIdx = find(strcmp(propNames, 'CustomStorageClass'));
    caIdx = find(strcmp(propNames, 'CustomAttributes'));
    % 58 60
    if gt(cscIdx, caIdx)
        % 60 62
        schema.prop(hThisClass, 'CustomAttributes', 'Simulink.BaseCSCAttributes');
        % 62 65
        % 63 65
        fullClassName = horzcat(hThisClass.Package.Name, '.', hThisClass.Name);
        warnTxt = 'This class (%s) was generated using an earlier version of MATLAB. It is strongly recommended that you use the Simulink data class designer to regenerate the classes in this package.';
        % 66 72
        % 67 72
        % 68 72
        % 69 72
        % 70 72
        warnState = warning('backtrace', 'off');
        warning(warnTxt, fullClassName);
        warning(warnState);
    end % if
end % function
