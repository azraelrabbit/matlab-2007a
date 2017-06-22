function CustomStorageClassListener(hRTWInfo)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    thisCSC = hRTWInfo.CustomStorageClass;
    % 9 10
    correctAttribClass = processcsc('CreateAttributesObject', 'mpt', thisCSC);
    correctAttribClassName = class(correctAttribClass);
    % 12 14
    % 13 14
    customstorageclasschanged(hRTWInfo, correctAttribClassName);
end % function
