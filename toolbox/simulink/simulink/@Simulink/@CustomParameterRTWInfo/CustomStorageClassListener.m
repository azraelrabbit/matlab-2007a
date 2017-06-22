function CustomStorageClassListener(hRTWInfo)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    thisCSC = hRTWInfo.CustomStorageClass;
    % 14 15
    cscAttribObject = processcsc('CreateAttributesObject', 'Simulink', thisCSC);
    cscAttribClass = class(cscAttribObject);
    % 17 19
    % 18 19
    customstorageclasschanged(hRTWInfo, cscAttribClass);
end % function
