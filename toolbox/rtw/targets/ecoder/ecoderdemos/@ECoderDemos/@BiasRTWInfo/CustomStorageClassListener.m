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
    switch thisCSC
    case 'BiasVariant'
        correctAttribClass = '';
    case 'Invariant'
        correctAttribClass = '';
    otherwise
        warning(horzcat('Unknown CustomStorageClass, ''', thisCSC, ''''));
        return;
    end % switch
    % 28 30
    % 29 30
    customstorageclasschanged(hRTWInfo, correctAttribClass);
end % function
