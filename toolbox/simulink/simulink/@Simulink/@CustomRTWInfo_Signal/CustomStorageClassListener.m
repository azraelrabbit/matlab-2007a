function CustomStorageClassListener(hRTWInfo)
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
    thisCSC = hRTWInfo.CustomStorageClass;
    % 19 20
    cscAttribObject = processcsc('CreateAttributesObject', 'Simulink', thisCSC);
    cscAttribClass = class(cscAttribObject);
    % 22 24
    % 23 24
    customstorageclasschanged(hRTWInfo, cscAttribClass);
end % function
